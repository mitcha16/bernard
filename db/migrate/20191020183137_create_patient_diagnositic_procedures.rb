# frozen_string_literal: true

class CreatePatientDiagnositicProcedures < ActiveRecord::Migration[5.2]
  def change
    create_table :patients_drs do |t|
      t.references :patient, foreign_key: true
      t.references :diagnostic_procedure, foreign_key: true

      t.timestamps
    end
  end
end
