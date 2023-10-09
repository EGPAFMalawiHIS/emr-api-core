# frozen_string_literal: true

# Migration responsible for creating the field_type table
class CreateFieldType < ActiveRecord::Migration[6.0]
  def change
    create_table :field_type, id: false do |t|
      t.bigint :field_type_id, null: false, limit: 4
      t.string :name, limit: 50
      t.text :description, limit: 4294967295
      t.boolean :is_set, null: false, default: '0'
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.string :uuid, null: false, limit: 38
    end
  end
end
