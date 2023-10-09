# frozen_string_literal: true

# Migration responsible for adding foreign keys to the order_type_class_map table
class AddForeignKeysToOrderTypeClassMap < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :order_type_class_map, :concept_class, column: :concept_class_id, primary_key: :concept_class_id
    add_foreign_key :order_type_class_map, :order_type, column: :order_type_id, primary_key: :order_type_id
  end
end
