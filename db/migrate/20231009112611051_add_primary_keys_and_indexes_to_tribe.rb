# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the tribe table
class AddPrimaryKeysAndIndexesToTribe < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE tribe ADD PRIMARY KEY (tribe_id)"
  end
end
