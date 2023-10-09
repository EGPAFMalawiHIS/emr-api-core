# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the program_workflow table
class AddPrimaryKeysAndIndexesToProgramWorkflow < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE program_workflow ADD PRIMARY KEY (program_workflow_id)"
  end
end
