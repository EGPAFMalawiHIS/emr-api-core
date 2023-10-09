# frozen_string_literal: true

# Migration responsible for creating the order_set table
class CreateOrderSet < ActiveRecord::Migration[6.0]
  def change
    create_table :order_set, id: false do |t|
      t.bigint :order_set_id, null: false, limit: 4
      t.string :operator, null: false, limit: 50
      t.string :name, null: false, limit: 255
      t.string :description, limit: 1000
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
