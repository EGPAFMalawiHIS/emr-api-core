# frozen_string_literal: true

# Migration responsible for creating the concept_state_conversion table
class CreateConceptStateConversion < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_state_conversion, id: false do |t|
      t.bigint :concept_state_conversion_id, null: false, limit: 4
      t.bigint :concept_id, default: '0', limit: 4
      t.bigint :program_workflow_id, default: '0', limit: 4
      t.bigint :program_workflow_state_id, default: '0', limit: 4
      t.string :uuid, null: false, limit: 38
    end
  end
end
