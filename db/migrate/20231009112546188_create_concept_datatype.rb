# frozen_string_literal: true

# Migration responsible for creating the concept_datatype table
class CreateConceptDatatype < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_datatype, id: false do |t|
      t.bigint :concept_datatype_id, null: false, limit: 4
      t.string :name, null: false, default: '', limit: 255
      t.string :hl7_abbreviation, limit: 3
      t.string :description, limit: 255
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.boolean :retired, null: false, default: '0'
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retire_reason, limit: 255
      t.string :uuid, null: false, limit: 38
    end
  end
end
