# frozen_string_literal: true

class PatientTreatment < ApplicationRecord
  belongs_to :patient
  belongs_to :treatment
end
