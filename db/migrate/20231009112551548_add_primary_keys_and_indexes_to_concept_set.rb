# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept_set table
class AddPrimaryKeysAndIndexesToConceptSet < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE concept_set ADD PRIMARY KEY (concept_set_id)"
  end
end
