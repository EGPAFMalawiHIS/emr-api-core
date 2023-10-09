# frozen_string_literal: true

# Migration responsible for creating the concept_reference_source table
class CreateConceptReferenceSource < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_reference_source, id: false do |t|
      t.bigint :concept_source_id, null: false, limit: 4
      t.string :name, null: false, default: '', limit: 50
      t.text :description, null: false, limit: 65535
      t.string :hl7_code, limit: 50
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.boolean :retired, null: false, default: '0'
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retire_reason, limit: 255
      t.string :uuid, null: false, limit: 38
      t.string :unique_id, limit: 250
      t.datetime :date_changed
      t.bigint :changed_by, limit: 4
    end
  end
end
