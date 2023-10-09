# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the program_workflow_state table
class AddPrimaryKeysAndIndexesToProgramWorkflowState < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE program_workflow_state ADD PRIMARY KEY (program_workflow_state_id)"
  end
end
