# frozen_string_literal: true

class AdmissionDiagnosis < ApplicationRecord
  belongs_to :admission
  belongs_to :diagnosis
end
