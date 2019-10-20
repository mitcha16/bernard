# frozen_string_literal: true

class CreateObservations < ActiveRecord::Migration[5.2]
  def change
    create_table :observations do |t|
      t.text :description
      t.datetime :moment
      t.references :admission, foreign_key: true

      t.timestamps
    end
  end
end
