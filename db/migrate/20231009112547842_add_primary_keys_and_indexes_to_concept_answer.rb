# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept_answer table
class AddPrimaryKeysAndIndexesToConceptAnswer < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE concept_answer ADD PRIMARY KEY (concept_answer_id)"
  end
end
