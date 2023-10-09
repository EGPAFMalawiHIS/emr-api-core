# frozen_string_literal: true

# Migration responsible for creating the concept_proposal_tag_map table
class CreateConceptProposalTagMap < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_proposal_tag_map, id: false do |t|
      t.bigint :concept_proposal_id, null: false, limit: 4
      t.bigint :concept_name_tag_id, null: false, limit: 4
    end
  end
end
