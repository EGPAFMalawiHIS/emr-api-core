# frozen_string_literal: true

# Migration responsible for adding foreign keys to the concept_proposal_tag_map table
class AddForeignKeysToConceptProposalTagMap < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :concept_proposal_tag_map, :concept_proposal, column: :concept_proposal_id, primary_key: :concept_proposal_id
    add_foreign_key :concept_proposal_tag_map, :concept_name_tag, column: :concept_name_tag_id, primary_key: :concept_name_tag_id
  end
end
