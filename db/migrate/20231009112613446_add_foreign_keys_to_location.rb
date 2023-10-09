# frozen_string_literal: true

# Migration responsible for adding foreign keys to the location table
class AddForeignKeysToLocation < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :location, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :location, :location, column: :parent_location, primary_key: :location_id
    add_foreign_key :location, :users, column: :creator, primary_key: :user_id
    add_foreign_key :location, :users, column: :retired_by, primary_key: :user_id
  end
end
