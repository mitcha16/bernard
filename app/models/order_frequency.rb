# frozen_string_literal: true

class OrderFrequency < ApplicationRecord
  belongs_to :medication_order
  enum frequency_unit: %i[hour]
end
