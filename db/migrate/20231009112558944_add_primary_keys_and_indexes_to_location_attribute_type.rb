# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the location_attribute_type table
class AddPrimaryKeysAndIndexesToLocationAttributeType < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE location_attribute_type ADD PRIMARY KEY (location_attribute_type_id)"
  end
end
