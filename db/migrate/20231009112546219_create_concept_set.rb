# frozen_string_literal: true

# Migration responsible for creating the concept_set table
class CreateConceptSet < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_set, id: false do |t|
      t.bigint :concept_set_id, null: false, limit: 4
      t.bigint :concept_id, null: false, default: '0', limit: 4
      t.bigint :concept_set, null: false, default: '0', limit: 4
      t.float :sort_weight, limit: 53
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.string :uuid, null: false, limit: 38
    end
  end
end
