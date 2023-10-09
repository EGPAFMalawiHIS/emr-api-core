# frozen_string_literal: true

# Migration responsible for adding foreign keys to the relationship_type table
class AddForeignKeysToRelationshipType < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :relationship_type, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :relationship_type, :users, column: :creator, primary_key: :user_id
    add_foreign_key :relationship_type, :users, column: :retired_by, primary_key: :user_id
  end
end
