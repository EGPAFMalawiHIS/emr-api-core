# frozen_string_literal: true

# Migration responsible for adding foreign keys to the order_group table
class AddForeignKeysToOrderGroup < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :order_group, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :order_group, :users, column: :creator, primary_key: :user_id
    add_foreign_key :order_group, :encounter, column: :encounter_id, primary_key: :encounter_id
    add_foreign_key :order_group, :patient, column: :patient_id, primary_key: :patient_id
    add_foreign_key :order_group, :order_set, column: :order_set_id, primary_key: :order_set_id
    add_foreign_key :order_group, :users, column: :voided_by, primary_key: :user_id
  end
end
