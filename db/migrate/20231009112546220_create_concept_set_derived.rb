# frozen_string_literal: true

# Migration responsible for creating the concept_set_derived table
class CreateConceptSetDerived < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_set_derived, id: false do |t|
      t.bigint :concept_id, null: false, default: '0', limit: 4
      t.bigint :concept_set, null: false, default: '0', limit: 4
      t.float :sort_weight, limit: 53
      t.string :uuid, limit: 38
    end
  end
end
