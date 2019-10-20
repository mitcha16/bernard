# frozen_string_literal: true

class CreatePatientMedicationOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :patients_medication_orders do |t|
      t.references :patient, foreign_key: true
      t.references :medication_order, foreign_key: true

      t.timestamps
    end
  end
end
