# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the person_address table
class AddPrimaryKeysAndIndexesToPersonAddress < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE person_address ADD PRIMARY KEY (person_address_id)"
  end
end
