# frozen_string_literal: true

# Migration responsible for creating the concept_reference_term table
class CreateConceptReferenceTerm < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_reference_term, id: false do |t|
      t.bigint :concept_reference_term_id, null: false, limit: 4
      t.bigint :concept_source_id, null: false, limit: 4
      t.string :name, limit: 255
      t.string :code, null: false, limit: 255
      t.string :version, limit: 255
      t.string :description, limit: 255
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false
      t.datetime :date_changed
      t.bigint :changed_by, limit: 4
      t.boolean :retired, null: false, default: '0'
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retire_reason, limit: 255
      t.string :uuid, null: false, limit: 38
    end
  end
end
