# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept_reference_term table
class AddPrimaryKeysAndIndexesToConceptReferenceTerm < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE concept_reference_term ADD PRIMARY KEY (concept_reference_term_id)"
  end
end
