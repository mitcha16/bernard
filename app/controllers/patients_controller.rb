# frozen_string_literal: true

class PatientsController < ApplicationController
  def index
    @patients ||= Patient.all
  end

  def show
    @patient = Patient.find(patient_params[:id])
    @facility = @patient.admission.facility
  end

  private

  def patient_params
    params.permit(:id)
  end
end
