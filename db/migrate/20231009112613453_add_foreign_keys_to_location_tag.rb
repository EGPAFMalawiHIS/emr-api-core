# frozen_string_literal: true

# Migration responsible for adding foreign keys to the location_tag table
class AddForeignKeysToLocationTag < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :location_tag, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :location_tag, :users, column: :creator, primary_key: :user_id
    add_foreign_key :location_tag, :users, column: :retired_by, primary_key: :user_id
  end
end
