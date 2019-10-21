# frozen_string_literal: true

require 'rails_helper'

describe Diagnosis, type: :model do
  let(:admission) { Admission.create(moment: DateTime.new(2019, 10, 11)) }
  let (:diagnosis) do
    Diagnosis.create(
      coding_system: 'system',
      code: '123',
      description: 'hay fever',
      admissions: [admission]
    )
  end

  describe 'attributes' do
    it 'should have a coding_system' do
      expect(diagnosis.coding_system).to eq('system')
    end

    it 'should have a code' do
      expect(diagnosis.code).to eq('123')
    end

    it 'should have a description' do
      expect(diagnosis.description).to eq('hay fever')
    end
  end

  describe 'relationships' do
    it 'should have many admissions' do
      expect(diagnosis.admissions).to eq([admission])
    end
  end
end
