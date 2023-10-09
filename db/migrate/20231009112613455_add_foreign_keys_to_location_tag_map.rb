# frozen_string_literal: true

# Migration responsible for adding foreign keys to the location_tag_map table
class AddForeignKeysToLocationTagMap < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :location_tag_map, :location, column: :location_id, primary_key: :location_id
    add_foreign_key :location_tag_map, :location_tag, column: :location_tag_id, primary_key: :location_tag_id
  end
end
