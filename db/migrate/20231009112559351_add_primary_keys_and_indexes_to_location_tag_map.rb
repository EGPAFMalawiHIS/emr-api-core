# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the location_tag_map table
class AddPrimaryKeysAndIndexesToLocationTagMap < ActiveRecord::Migration[6.0]
  def up
    add_index :location_tag_map, %i[location_id location_tag_id], unique: true
  end

  def down
    remove_index :location_tag_map, %i[location_id location_tag_id]
  end
end
