# frozen_string_literal: true

class CreateOrderFrequencies < ActiveRecord::Migration[5.2]
  def change
    create_table :order_frequencies do |t|
      t.string :value
      t.integer :frequency_unit
      t.references :medication_order, foreign_key: true

      t.timestamps
    end
  end
end
