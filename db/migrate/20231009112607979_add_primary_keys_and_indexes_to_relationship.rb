# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the relationship table
class AddPrimaryKeysAndIndexesToRelationship < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE relationship ADD PRIMARY KEY (relationship_id)"
  end
end
