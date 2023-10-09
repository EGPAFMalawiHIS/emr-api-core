# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept_reference_map table
class AddPrimaryKeysAndIndexesToConceptReferenceMap < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE concept_reference_map ADD PRIMARY KEY (concept_map_id)"
  end
end
