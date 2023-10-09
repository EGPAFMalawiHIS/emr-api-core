# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept_complex table
class AddPrimaryKeysAndIndexesToConceptComplex < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE concept_complex ADD PRIMARY KEY (concept_id)"
  end
end
