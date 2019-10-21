# frozen_string_literal: true

class Patient < ApplicationRecord
  has_one :admission
  has_one :treatment
  has_many :diagnoses, through: :admission
  has_many :symptoms, through: :admission
  has_many :observations, through: :admission
  has_many :medication_orders
  has_many :diagnostic_procedures
  has_and_belongs_to_many :allergies, join_table: :patients_allergies

  alias chronic_conditions diagnoses

  enum gender: %i[male female other]

  def name
    "#{first_name} #{middle_name.first}. #{last_name}"
  end

  def age
    ((Time.zone.now - dob.to_time) / 1.year.seconds).floor
  end

  def parsed_data(attribute)
    send(attribute).pluck(:description).to_sentence
  end

  def parsed_data_with_code(attribute)
    send(attribute).map { |a| "#{a.description} (#{a.code})" }.to_sentence
  end

  def parsed_medication_order
    medication_orders.map { |m| [m.name, m.dosage, m.medication_route, m.order_frequency&.value, 'to', m.necessity].join(' ') }.to_sentence
  end

  def parsed_diagnostic_procedure
    diagnostic_procedures.map { |d| [d.description, 'on', d.moment&.strftime('%B %d, %Y'), 'at', d.moment&.strftime('%-I:%M %p')].join(' ') }.to_sentence
  end

  def parsed_treatment
    [treatment.description, 'to', treatment.necessity].join(' ')
  end
end
