# frozen_string_literal: true

# Migration responsible for creating the serialized_object table
class CreateSerializedObject < ActiveRecord::Migration[6.0]
  def change
    create_table :serialized_object, id: false do |t|
      t.bigint :serialized_object_id, null: false, limit: 4
      t.string :name, null: false, limit: 255
      t.string :description, limit: 5000
      t.string :type, null: false, limit: 255
      t.string :subtype, null: false, limit: 255
      t.string :serialization_class, null: false, limit: 255
      t.text :serialized_data, null: false, limit: 16777215
      t.datetime :date_created, null: false
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_changed
      t.bigint :changed_by, limit: 4
      t.boolean :retired, null: false, default: '0'
      t.datetime :date_retired
      t.bigint :retired_by, limit: 4
      t.string :retire_reason, limit: 1000
      t.string :uuid, null: false, limit: 38
    end
  end
end
