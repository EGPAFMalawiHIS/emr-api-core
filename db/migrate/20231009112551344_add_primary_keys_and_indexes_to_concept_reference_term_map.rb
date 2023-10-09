# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept_reference_term_map table
class AddPrimaryKeysAndIndexesToConceptReferenceTermMap < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE concept_reference_term_map ADD PRIMARY KEY (concept_reference_term_map_id)"
  end
end
