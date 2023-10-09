# frozen_string_literal: true

# Migration responsible for creating the concept_reference_term_map table
class CreateConceptReferenceTermMap < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_reference_term_map, id: false do |t|
      t.bigint :concept_reference_term_map_id, null: false, limit: 4
      t.bigint :term_a_id, null: false, limit: 4
      t.bigint :term_b_id, null: false, limit: 4
      t.bigint :a_is_to_b_id, null: false, limit: 4
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.string :uuid, null: false, limit: 38
    end
  end
end
