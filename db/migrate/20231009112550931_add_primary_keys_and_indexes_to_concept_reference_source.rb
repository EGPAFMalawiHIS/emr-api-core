# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept_reference_source table
class AddPrimaryKeysAndIndexesToConceptReferenceSource < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE concept_reference_source ADD PRIMARY KEY (concept_source_id)"
  end
end
