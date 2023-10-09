# frozen_string_literal: true

# Migration responsible for creating the field table
class CreateField < ActiveRecord::Migration[6.0]
  def change
    create_table :field, id: false do |t|
      t.bigint :field_id, null: false, limit: 4
      t.string :name, null: false, default: '', limit: 255
      t.text :description, limit: 65535
      t.bigint :field_type, limit: 4
      t.bigint :concept_id, limit: 4
      t.string :table_name, limit: 50
      t.string :attribute_name, limit: 50
      t.text :default_value, limit: 65535
      t.boolean :select_multiple, null: false, default: '0'
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.boolean :retired, null: false, default: '0'
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retire_reason, limit: 255
      t.string :uuid, null: false, limit: 38
    end
  end
end
