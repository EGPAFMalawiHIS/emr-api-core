# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the relationship_type table
class AddPrimaryKeysAndIndexesToRelationshipType < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE relationship_type ADD PRIMARY KEY (relationship_type_id)"
  end
end
