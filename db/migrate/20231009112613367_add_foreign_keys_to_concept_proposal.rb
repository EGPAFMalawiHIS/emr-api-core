# frozen_string_literal: true

# Migration responsible for adding foreign keys to the concept_proposal table
class AddForeignKeysToConceptProposal < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :concept_proposal, :concept, column: :concept_id, primary_key: :concept_id
    add_foreign_key :concept_proposal, :encounter, column: :encounter_id, primary_key: :encounter_id
    add_foreign_key :concept_proposal, :concept, column: :obs_concept_id, primary_key: :concept_id
    add_foreign_key :concept_proposal, :obs, column: :obs_id, primary_key: :obs_id
    add_foreign_key :concept_proposal, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :concept_proposal, :users, column: :creator, primary_key: :user_id
  end
end
