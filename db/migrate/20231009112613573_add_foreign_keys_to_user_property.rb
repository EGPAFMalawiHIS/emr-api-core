# frozen_string_literal: true

# Migration responsible for adding foreign keys to the user_property table
class AddForeignKeysToUserProperty < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :user_property, :users, column: :user_id, primary_key: :user_id
  end
end
