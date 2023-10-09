# frozen_string_literal: true

# Migration responsible for creating the order_type_class_map table
class CreateOrderTypeClassMap < ActiveRecord::Migration[6.0]
  def change
    create_table :order_type_class_map, id: false do |t|
      t.bigint :order_type_id, null: false, limit: 4
      t.bigint :concept_class_id, null: false, limit: 4
    end
  end
end
