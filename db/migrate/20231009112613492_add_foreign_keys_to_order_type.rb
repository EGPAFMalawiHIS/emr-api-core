# frozen_string_literal: true

# Migration responsible for adding foreign keys to the order_type table
class AddForeignKeysToOrderType < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :order_type, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :order_type, :order_type, column: :parent, primary_key: :order_type_id
    add_foreign_key :order_type, :users, column: :creator, primary_key: :user_id
    add_foreign_key :order_type, :users, column: :retired_by, primary_key: :user_id
  end
end
