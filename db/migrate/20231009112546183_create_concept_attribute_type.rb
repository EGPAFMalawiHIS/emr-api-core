# frozen_string_literal: true

# Migration responsible for creating the concept_attribute_type table
class CreateConceptAttributeType < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_attribute_type, id: false do |t|
      t.bigint :concept_attribute_type_id, null: false, limit: 4
      t.string :name, null: false, limit: 255
      t.string :description, limit: 1024
      t.string :datatype, limit: 255
      t.text :datatype_config, limit: 65535
      t.string :preferred_handler, limit: 255
      t.text :handler_config, limit: 65535
      t.bigint :min_occurs, null: false, limit: 4
      t.bigint :max_occurs, limit: 4
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false
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
