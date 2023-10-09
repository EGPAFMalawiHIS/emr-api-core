# frozen_string_literal: true

# Migration responsible for creating the concept_map_type table
class CreateConceptMapType < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_map_type, id: false do |t|
      t.bigint :concept_map_type_id, null: false, limit: 4
      t.string :name, null: false, limit: 255
      t.string :description, limit: 255
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.boolean :is_hidden
      t.boolean :retired, null: false, default: '0'
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retire_reason, limit: 255
      t.string :uuid, null: false, limit: 38
    end
  end
end
