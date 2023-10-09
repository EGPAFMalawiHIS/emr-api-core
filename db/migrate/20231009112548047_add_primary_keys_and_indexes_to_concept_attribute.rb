# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept_attribute table
class AddPrimaryKeysAndIndexesToConceptAttribute < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE concept_attribute ADD PRIMARY KEY (concept_attribute_id)"
  end
end
