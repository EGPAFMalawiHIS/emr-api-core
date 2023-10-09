# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept_proposal table
class AddPrimaryKeysAndIndexesToConceptProposal < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE concept_proposal ADD PRIMARY KEY (concept_proposal_id)"
  end
end
