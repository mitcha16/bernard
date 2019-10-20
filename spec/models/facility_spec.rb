# frozen_string_literal: true

require 'rails_helper'

describe Facility, type: :model do
  let(:facility) { Facility.create(name: 'Sacred Heart') }
  describe 'attributes' do
    it 'should have a name' do
      expect(facility.name).to eq('Sacred Heart')
    end
  end
end
