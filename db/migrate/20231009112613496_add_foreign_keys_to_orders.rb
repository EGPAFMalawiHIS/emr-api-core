# frozen_string_literal: true

# Migration responsible for adding foreign keys to the orders table
class AddForeignKeysToOrders < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :orders, :concept, column: :order_reason, primary_key: :concept_id
    add_foreign_key :orders, :provider, column: :orderer, primary_key: :provider_id
    add_foreign_key :orders, :care_setting, column: :care_setting, primary_key: :care_setting_id
    add_foreign_key :orders, :encounter, column: :encounter_id, primary_key: :encounter_id
    add_foreign_key :orders, :order_group, column: :order_group_id, primary_key: :order_group_id
    add_foreign_key :orders, :users, column: :creator, primary_key: :user_id
    add_foreign_key :orders, :patient, column: :patient_id, primary_key: :patient_id
    add_foreign_key :orders, :orders, column: :previous_order_id, primary_key: :order_id
    add_foreign_key :orders, :order_type, column: :order_type_id, primary_key: :order_type_id
    add_foreign_key :orders, :users, column: :voided_by, primary_key: :user_id
  end
end
