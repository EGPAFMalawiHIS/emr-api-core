# frozen_string_literal: true

# Migration responsible for adding foreign keys to the global_property table
class AddForeignKeysToGlobalProperty < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :global_property, :users, column: :changed_by, primary_key: :user_id
  end
end
