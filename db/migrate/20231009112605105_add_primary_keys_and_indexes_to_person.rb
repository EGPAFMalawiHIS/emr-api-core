# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the person table
class AddPrimaryKeysAndIndexesToPerson < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE person ADD PRIMARY KEY (person_id)"
  end
end
