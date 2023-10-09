# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the person_attribute table
class AddPrimaryKeysAndIndexesToPersonAttribute < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE person_attribute ADD PRIMARY KEY (person_attribute_id)"
  end
end
