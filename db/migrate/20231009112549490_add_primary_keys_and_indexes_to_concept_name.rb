# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept_name table
class AddPrimaryKeysAndIndexesToConceptName < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE concept_name ADD PRIMARY KEY (concept_name_id)"
  end
end
