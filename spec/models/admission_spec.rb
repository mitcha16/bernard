# frozen_string_literal: true

require 'rails_helper'

describe Admission, type: :model do
  let(:facility) { Facility.create(name: 'Sacred Heart') }
  let(:patient) { Patient.create(first_name: 'John') }
  let(:admission) do
    Admission.create(
      moment: DateTime.new(2019, 10, 11),
      facility: facility,
      diagnoses: [diagnosis],
      patient: patient
    )
  end
  let (:diagnosis) do
    Diagnosis.create(
      coding_system: 'system',
      code: '123',
      description: 'hay fever'
    )
  end

  describe 'attributes' do
    it 'should have a moment' do
      expect(admission.moment).to eq(DateTime.new(2019, 10, 11))
    end
  end
  describe 'relationships' do
    it 'should have a facility' do
      expect(admission.facility).to eq(facility)
    end

    it 'should have many diagnoses' do
      expect(admission.diagnoses).to eq([diagnosis])
    end

    it 'should have a patient' do
      expect(admission.patient).to eq(patient)
    end
  end
end
