# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the location table
class AddPrimaryKeysAndIndexesToLocation < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE location ADD PRIMARY KEY (location_id)"
  end
end
