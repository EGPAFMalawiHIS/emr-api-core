# frozen_string_literal: true

# Migration responsible for creating the test_order table
class CreateTestOrder < ActiveRecord::Migration[6.0]
  def change
    create_table :test_order, id: false do |t|
      t.bigint :order_id, null: false, default: '0', limit: 4
      t.bigint :specimen_source, limit: 4
      t.string :laterality, limit: 20
      t.text :clinical_history, limit: 65535
      t.bigint :frequency, limit: 4
      t.bigint :number_of_repeats, limit: 4
    end
  end
end
