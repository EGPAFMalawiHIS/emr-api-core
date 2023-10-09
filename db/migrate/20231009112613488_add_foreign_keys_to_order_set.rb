# frozen_string_literal: true

# Migration responsible for adding foreign keys to the order_set table
class AddForeignKeysToOrderSet < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :order_set, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :order_set, :users, column: :creator, primary_key: :user_id
    add_foreign_key :order_set, :users, column: :retired_by, primary_key: :user_id
  end
end
