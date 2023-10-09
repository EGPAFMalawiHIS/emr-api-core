# frozen_string_literal: true

# Migration responsible for creating the drug_order table
class CreateDrugOrder < ActiveRecord::Migration[6.0]
  def change
    create_table :drug_order, id: false do |t|
      t.bigint :order_id, null: false, default: '0', limit: 4
      t.bigint :drug_inventory_id, limit: 4
      t.float :dose, limit: 53
      t.boolean :as_needed
      t.string :dosing_type, limit: 255
      t.float :quantity, limit: 53
      t.string :as_needed_condition, limit: 255
      t.bigint :num_refills, limit: 4
      t.text :dosing_instructions, limit: 65535
      t.bigint :duration, limit: 4
      t.bigint :duration_units, limit: 4
      t.bigint :quantity_units, limit: 4
      t.bigint :route, limit: 4
      t.bigint :dose_units, limit: 4
      t.bigint :frequency, limit: 4
      t.string :brand_name, limit: 255
      t.boolean :dispense_as_written, null: false, default: '0'
      t.string :drug_non_coded, limit: 255
    end
  end
end
