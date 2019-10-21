# frozen_string_literal: true

class Patient < ApplicationRecord
  has_one :admission
  has_one :treatment
  has_many :diagnoses, through: :admission
  has_many :medication_orders
  has_many :diagnostic_procedures
  has_and_belongs_to_many :allergies, join_table: :patients_allergies

  alias chronic_conditions diagnoses

  enum gender: %i[male female other]

  def name
    "#{first_name} #{middle_name.first}. #{last_name}"
  end
end
