# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the order_type_class_map table
class AddPrimaryKeysAndIndexesToOrderTypeClassMap < ActiveRecord::Migration[6.0]
  def up
    add_index :order_type_class_map, %i[order_type_id concept_class_id], unique: true
  end

  def down
    remove_index :order_type_class_map, %i[order_type_id concept_class_id]
  end
end
