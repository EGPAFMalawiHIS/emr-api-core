# frozen_string_literal: true

# Migration responsible for adding foreign keys to the user_role table
class AddForeignKeysToUserRole < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :user_role, :role, column: :role, primary_key: :role
    add_foreign_key :user_role, :users, column: :user_id, primary_key: :user_id
  end
end
