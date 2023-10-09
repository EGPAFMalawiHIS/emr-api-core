# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the person_attribute_type table
class AddPrimaryKeysAndIndexesToPersonAttributeType < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE person_attribute_type ADD PRIMARY KEY (person_attribute_type_id)"
  end
end
