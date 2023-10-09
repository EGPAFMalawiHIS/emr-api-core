# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept_class table
class AddPrimaryKeysAndIndexesToConceptClass < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE concept_class ADD PRIMARY KEY (concept_class_id)"
  end
end
