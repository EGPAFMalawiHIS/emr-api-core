# frozen_string_literal: true

# Migration responsible for adding foreign keys to the order_set_member table
class AddForeignKeysToOrderSetMember < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :order_set_member, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :order_set_member, :concept, column: :concept_id, primary_key: :concept_id
    add_foreign_key :order_set_member, :users, column: :creator, primary_key: :user_id
    add_foreign_key :order_set_member, :order_set, column: :order_set_id, primary_key: :order_set_id
    add_foreign_key :order_set_member, :order_type, column: :order_type, primary_key: :order_type_id
    add_foreign_key :order_set_member, :users, column: :retired_by, primary_key: :user_id
  end
end
