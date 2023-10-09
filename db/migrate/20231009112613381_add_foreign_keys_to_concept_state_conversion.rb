# frozen_string_literal: true

# Migration responsible for adding foreign keys to the concept_state_conversion table
class AddForeignKeysToConceptStateConversion < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :concept_state_conversion, :concept, column: :concept_id, primary_key: :concept_id
    add_foreign_key :concept_state_conversion, :program_workflow, column: :program_workflow_id, primary_key: :program_workflow_id
    add_foreign_key :concept_state_conversion, :program_workflow_state, column: :program_workflow_state_id, primary_key: :program_workflow_state_id
  end
end
