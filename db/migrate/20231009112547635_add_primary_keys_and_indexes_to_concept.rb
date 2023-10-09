# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept table
class AddPrimaryKeysAndIndexesToConcept < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE concept ADD PRIMARY KEY (concept_id)"
  end
end
