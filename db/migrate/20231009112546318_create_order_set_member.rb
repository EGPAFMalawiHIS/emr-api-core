# frozen_string_literal: true

# Migration responsible for creating the order_set_member table
class CreateOrderSetMember < ActiveRecord::Migration[6.0]
  def change
    create_table :order_set_member, id: false do |t|
      t.bigint :order_set_member_id, null: false, limit: 4
      t.bigint :order_type, null: false, limit: 4
      t.text :order_template, limit: 65535
      t.string :order_template_type, limit: 1024
      t.bigint :order_set_id, null: false, limit: 4
      t.bigint :sequence_number, null: false, limit: 4
      t.bigint :concept_id, null: false, limit: 4
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false
      t.boolean :retired, null: false, default: '0'
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retire_reason, limit: 255
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.string :uuid, null: false, limit: 38
    end
  end
end
