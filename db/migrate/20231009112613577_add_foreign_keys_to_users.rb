# frozen_string_literal: true

# Migration responsible for adding foreign keys to the users table
class AddForeignKeysToUsers < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :users, :person, column: :person_id, primary_key: :person_id
    add_foreign_key :users, :users, column: :creator, primary_key: :user_id
    add_foreign_key :users, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :users, :users, column: :retired_by, primary_key: :user_id
  end
end