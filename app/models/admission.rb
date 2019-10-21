# frozen_string_literal: true

class Admission < ApplicationRecord
  belongs_to :patient
  belongs_to :facility

  has_and_belongs_to_many :diagnoses, join_table: :admissions_diagnoses
end
