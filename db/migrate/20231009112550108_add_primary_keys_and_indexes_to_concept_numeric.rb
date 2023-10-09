# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept_numeric table
class AddPrimaryKeysAndIndexesToConceptNumeric < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE concept_numeric ADD PRIMARY KEY (concept_id)"
  end
end
