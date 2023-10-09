# frozen_string_literal: true

# Migration responsible for creating the order_type table
class CreateOrderType < ActiveRecord::Migration[6.0]
  def change
    create_table :order_type, id: false do |t|
      t.bigint :order_type_id, null: false, limit: 4
      t.string :name, null: false, default: '', limit: 255
      t.text :description, limit: 65535
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.boolean :retired, null: false, default: '0'
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retire_reason, limit: 255
      t.string :uuid, null: false, limit: 38
      t.string :java_class_name, null: false, limit: 255
      t.bigint :parent, limit: 4
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
    end
  end
end
