# frozen_string_literal: true

# Migration responsible for creating the orders table
class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders, id: false do |t|
      t.bigint :order_id, null: false, limit: 4
      t.bigint :order_type_id, null: false, default: '0', limit: 4
      t.bigint :concept_id, null: false, default: '0', limit: 4
      t.bigint :orderer, null: false, limit: 4
      t.bigint :encounter_id, null: false, limit: 4
      t.text :instructions, limit: 65535
      t.datetime :date_activated
      t.datetime :auto_expire_date
      t.datetime :date_stopped
      t.bigint :order_reason, limit: 4
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.boolean :voided, null: false, default: '0'
      t.bigint :voided_by, limit: 4
      t.datetime :date_voided
      t.string :void_reason, limit: 255
      t.bigint :patient_id, null: false, limit: 4
      t.string :accession_number, limit: 255
      t.string :uuid, null: false, limit: 38
      t.string :order_reason_non_coded, limit: 255
      t.string :urgency, null: false, default: '', limit: 50
      t.string :order_number, null: false, limit: 50
      t.bigint :previous_order_id, limit: 4
      t.string :order_action, null: false, limit: 50
      t.string :comment_to_fulfiller, limit: 1024
      t.bigint :care_setting, null: false, limit: 4
      t.datetime :scheduled_date
      t.bigint :order_group_id, limit: 4
      t.float :sort_weight, limit: 53
      t.string :fulfiller_comment, limit: 1024
      t.string :fulfiller_status, limit: 50
    end
  end
end
