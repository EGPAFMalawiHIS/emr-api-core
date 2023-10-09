# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the field_type table
class AddPrimaryKeysAndIndexesToFieldType < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE field_type ADD PRIMARY KEY (field_type_id)"
  end
end
