# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept_word table
class AddPrimaryKeysAndIndexesToConceptWord < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE concept_word ADD PRIMARY KEY (concept_word_id)"
  end
end
