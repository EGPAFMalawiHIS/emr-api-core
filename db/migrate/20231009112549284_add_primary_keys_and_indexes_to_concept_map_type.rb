# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept_map_type table
class AddPrimaryKeysAndIndexesToConceptMapType < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE concept_map_type ADD PRIMARY KEY (concept_map_type_id)"
  end
end
