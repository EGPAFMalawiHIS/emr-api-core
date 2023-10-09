# frozen_string_literal: true

# Migration responsible for adding foreign keys to the program_workflow_state table
class AddForeignKeysToProgramWorkflowState < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :program_workflow_state, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :program_workflow_state, :concept, column: :concept_id, primary_key: :concept_id
    add_foreign_key :program_workflow_state, :users, column: :creator, primary_key: :user_id
    add_foreign_key :program_workflow_state, :program_workflow, column: :program_workflow_id, primary_key: :program_workflow_id
  end
end
