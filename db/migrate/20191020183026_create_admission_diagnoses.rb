# frozen_string_literal: true

class CreateAdmissionDiagnoses < ActiveRecord::Migration[5.2]
  def change
    create_table :admissions_diagnoses do |t|
      t.references :admission, foreign_key: true
      t.references :diagnosis, foreign_key: true

      t.timestamps
    end
  end
end
