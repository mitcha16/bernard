# frozen_string_literal: true

require 'rails_helper'

describe Patient, type: :model do
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
      diagnoses: [diagnosis]
    )
  end
  let(:patient) do
    Patient.create(
      first_name: 'John',
      middle_name: 'Kipu',
      last_name: 'Smith',
      mr: 'medical record',
      dob: DateTime.new(1992, 0o5, 30),
      gender: :male,
      admission: admission
    )
  end
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
    end
  end
end
