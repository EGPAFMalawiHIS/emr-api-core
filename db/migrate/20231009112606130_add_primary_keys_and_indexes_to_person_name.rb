# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the person_name table
class AddPrimaryKeysAndIndexesToPersonName < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE person_name ADD PRIMARY KEY (person_name_id)"
  end
end
