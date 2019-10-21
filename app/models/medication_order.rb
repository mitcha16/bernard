# frozen_string_literal: true

class MedicationOrder < ApplicationRecord
  belongs_to :patient
end
