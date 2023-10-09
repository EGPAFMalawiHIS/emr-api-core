# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept_stop_word table
class AddPrimaryKeysAndIndexesToConceptStopWord < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE concept_stop_word ADD PRIMARY KEY (concept_stop_word_id)"
  end
end
