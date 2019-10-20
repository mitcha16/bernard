# frozen_string_literal: true

class PatientDiagnositicProcedure < ApplicationRecord
  belongs_to :patient
  belongs_to :diagnostic_procedure
end
