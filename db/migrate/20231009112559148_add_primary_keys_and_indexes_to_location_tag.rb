# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the location_tag table
class AddPrimaryKeysAndIndexesToLocationTag < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE location_tag ADD PRIMARY KEY (location_tag_id)"
  end
end
