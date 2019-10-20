# frozen_string_literal: true

class CreateAdmissionSymptoms < ActiveRecord::Migration[5.2]
  def change
    create_table :admissions_symptoms do |t|
      t.references :admission, foreign_key: true
      t.references :symptom, foreign_key: true

      t.timestamps
    end
  end
end
