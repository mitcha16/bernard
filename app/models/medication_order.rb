# frozen_string_literal: true

class MedicationOrder < ApplicationRecord
  belongs_to :patient
  has_one :order_frequency

  enum medication_route: %i[PO IM SC]
  enum unit: %i[mg]
end
