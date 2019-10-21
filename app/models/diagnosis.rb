# frozen_string_literal: true

class Diagnosis < ApplicationRecord
  has_and_belongs_to_many :admissions, join_table: :admissions_diagnoses
end
