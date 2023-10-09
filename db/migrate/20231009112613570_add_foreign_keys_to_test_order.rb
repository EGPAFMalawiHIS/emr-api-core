# frozen_string_literal: true

# Migration responsible for adding foreign keys to the test_order table
class AddForeignKeysToTestOrder < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :test_order, :order_frequency, column: :frequency, primary_key: :order_frequency_id
    add_foreign_key :test_order, :orders, column: :order_id, primary_key: :order_id
    add_foreign_key :test_order, :concept, column: :specimen_source, primary_key: :concept_id
  end
end
