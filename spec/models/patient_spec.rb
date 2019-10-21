# frozen_string_literal: true

require 'rails_helper'

describe Patient, type: :model do
  let(:patient) do
    Patient.create(
      first_name: 'John',
      middle_name: 'Kipu',
      last_name: 'Smith',
      mr: 'medical record',
      dob: DateTime.new(1992, 0o5, 30),
      gender: :male,
      admission: admission,
      allergies: [allergy],
      medication_orders: [mo],
      diagnostic_procedures: [dp],
      treatment: treatment
    )
  end
  let (:diagnosis) do
    Diagnosis.create(
      coding_system: 'system',
      code: '123',
      description: 'hay fever'
    )
  end
  let(:admission) do
    Admission.create(
      moment: DateTime.new(2019, 10, 11),
      facility: Facility.new,
      diagnoses: [diagnosis]
    )
  end
  let(:allergy) { Allergy.create(description: 'cats') }
  let(:mo) { MedicationOrder.create(name: 'tylenol') }
  let(:dp) { DiagnosticProcedure.create(description: 'surgery') }
  let(:treatment) { Treatment.create(description: 'surgical') }

  describe 'attributes' do
    it 'should have a first_name' do
      expect(patient.first_name).to eq('John')
    end

    it 'should have a middle_name' do
      expect(patient.middle_name).to eq('Kipu')
    end

    it 'should have a last_name' do
      expect(patient.last_name).to eq('Smith')
    end

    it 'should have a medical record' do
      expect(patient.mr).to eq('medical record')
    end

    it 'should have a dob' do
      expect(patient.dob).to eq(DateTime.new(1992, 0o5, 30))
    end

    it 'should have a gender' do
      expect(patient.gender).to eq('male')
    end
  end

  describe 'relationships' do
    it 'should have an admission' do
      expect(patient.admission).to eq(admission)
    end

    it 'should have many diagnoses' do
      expect(patient.diagnoses).to eq([diagnosis])
    end

    it 'should have many chronic_conditions' do
      expect(patient.chronic_conditions).to eq([diagnosis])
    end

    it 'should have many allergies' do
      expect(patient.allergies).to eq([allergy])
    end

    it 'should have many medication orders' do
      expect(patient.medication_orders).to eq([mo])
    end

    it 'should have many diagnostic_procedures' do
      expect(patient.diagnostic_procedures).to eq([dp])
    end

    it 'should have a treatment' do
      expect(patient.treatment).to eq(treatment)
    end
  end
end
