# frozen_string_literal: true

# Migration responsible for adding foreign keys to the relationship table
class AddForeignKeysToRelationship < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :relationship, :person, column: :person_a, primary_key: :person_id
    add_foreign_key :relationship, :person, column: :person_b, primary_key: :person_id
    add_foreign_key :relationship, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :relationship, :relationship_type, column: :relationship, primary_key: :relationship_type_id
    add_foreign_key :relationship, :users, column: :creator, primary_key: :user_id
    add_foreign_key :relationship, :users, column: :voided_by, primary_key: :user_id
  end
end
