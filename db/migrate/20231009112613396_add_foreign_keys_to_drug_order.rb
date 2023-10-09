# frozen_string_literal: true

# Migration responsible for adding foreign keys to the drug_order table
class AddForeignKeysToDrugOrder < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :drug_order, :concept, column: :dose_units, primary_key: :concept_id
    add_foreign_key :drug_order, :concept, column: :duration_units, primary_key: :concept_id
    add_foreign_key :drug_order, :order_frequency, column: :frequency, primary_key: :order_frequency_id
    add_foreign_key :drug_order, :concept, column: :quantity_units, primary_key: :concept_id
    add_foreign_key :drug_order, :concept, column: :route, primary_key: :concept_id
    add_foreign_key :drug_order, :orders, column: :order_id, primary_key: :order_id
    add_foreign_key :drug_order, :drug, column: :drug_inventory_id, primary_key: :drug_id
  end
end
