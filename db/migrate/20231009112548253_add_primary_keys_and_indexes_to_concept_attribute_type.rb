# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept_attribute_type table
class AddPrimaryKeysAndIndexesToConceptAttributeType < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE concept_attribute_type ADD PRIMARY KEY (concept_attribute_type_id)"
  end
end
