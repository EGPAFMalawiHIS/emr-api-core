# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept_datatype table
class AddPrimaryKeysAndIndexesToConceptDatatype < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE concept_datatype ADD PRIMARY KEY (concept_datatype_id)"
  end
end
