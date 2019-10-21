# frozen_string_literal: true

class Admission < ApplicationRecord
  belongs_to :patient
  belongs_to :facility

  has_many :observations

  has_and_belongs_to_many :diagnoses, join_table: :admissions_diagnoses
  has_and_belongs_to_many :symptoms, join_table: :admissions_symptoms

  def date
    moment.strftime('%B %d, %Y')
  end

  def time
    moment.strftime('%-I:%M %p')
  end
end
