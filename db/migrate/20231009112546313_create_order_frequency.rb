# frozen_string_literal: true

# Migration responsible for creating the order_frequency table
class CreateOrderFrequency < ActiveRecord::Migration[6.0]
  def change
    create_table :order_frequency, id: false do |t|
      t.bigint :order_frequency_id, null: false, limit: 4
      t.bigint :concept_id, null: false, limit: 4
      t.float :frequency_per_day, limit: 53
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
