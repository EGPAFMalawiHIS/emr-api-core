# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept_description table
class AddPrimaryKeysAndIndexesToConceptDescription < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE concept_description ADD PRIMARY KEY (concept_description_id)"
  end
end
