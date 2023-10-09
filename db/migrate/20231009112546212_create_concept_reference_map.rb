# frozen_string_literal: true

# Migration responsible for creating the concept_reference_map table
class CreateConceptReferenceMap < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_reference_map, id: false do |t|
      t.bigint :concept_map_id, null: false, limit: 4
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :concept_id, null: false, default: '0', limit: 4
      t.string :uuid, null: false, limit: 38
      t.bigint :concept_reference_term_id, null: false, limit: 4
      t.bigint :concept_map_type_id, null: false, default: '0', limit: 4
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
    end
  end
end
