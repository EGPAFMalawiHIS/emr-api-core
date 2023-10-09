# frozen_string_literal: true

# Migration responsible for creating the concept_answer table
class CreateConceptAnswer < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_answer, id: false do |t|
      t.bigint :concept_answer_id, null: false, limit: 4
      t.bigint :concept_id, null: false, default: '0', limit: 4
      t.bigint :answer_concept, limit: 4
      t.bigint :answer_drug, limit: 4
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.string :uuid, null: false, limit: 38
      t.float :sort_weight, limit: 53
    end
  end
end
