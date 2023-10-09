# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the location_attribute table
class AddPrimaryKeysAndIndexesToLocationAttribute < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE location_attribute ADD PRIMARY KEY (location_attribute_id)"
  end
end
