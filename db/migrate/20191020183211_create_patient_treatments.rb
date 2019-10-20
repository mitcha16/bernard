# frozen_string_literal: true

class CreatePatientTreatments < ActiveRecord::Migration[5.2]
  def change
    create_table :patients_treatments do |t|
      t.references :patient, foreign_key: true
      t.references :treatment, foreign_key: true

      t.timestamps
    end
  end
end
