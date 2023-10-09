# frozen_string_literal: true

# Migration responsible for creating the program_workflow_state table
class CreateProgramWorkflowState < ActiveRecord::Migration[6.0]
  def change
    create_table :program_workflow_state, id: false do |t|
      t.bigint :program_workflow_state_id, null: false, limit: 4
      t.bigint :program_workflow_id, null: false, default: '0', limit: 4
      t.bigint :concept_id, null: false, default: '0', limit: 4
      t.boolean :initial, null: false, default: '0'
      t.boolean :terminal, null: false, default: '0'
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.boolean :retired, null: false, default: '0'
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.string :uuid, null: false, limit: 38
    end
  end
end
