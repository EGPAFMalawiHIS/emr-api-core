# frozen_string_literal: true

# Migration responsible for creating the order_group table
class CreateOrderGroup < ActiveRecord::Migration[6.0]
  def change
    create_table :order_group, id: false do |t|
      t.bigint :order_group_id, null: false, limit: 4
      t.bigint :order_set_id, limit: 4
      t.bigint :patient_id, null: false, limit: 4
      t.bigint :encounter_id, null: false, limit: 4
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false
      t.boolean :voided, null: false, default: '0'
      t.bigint :voided_by, limit: 4
      t.datetime :date_voided
      t.string :void_reason, limit: 255
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.string :uuid, null: false, limit: 38
    end
  end
end
