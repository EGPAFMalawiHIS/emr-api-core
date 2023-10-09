# frozen_string_literal: true

# Migration responsible for adding foreign keys to the program_workflow table
class AddForeignKeysToProgramWorkflow < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :program_workflow, :program, column: :program_id, primary_key: :program_id
    add_foreign_key :program_workflow, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :program_workflow, :concept, column: :concept_id, primary_key: :concept_id
    add_foreign_key :program_workflow, :users, column: :creator, primary_key: :user_id
  end
end
