# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the field table
class AddPrimaryKeysAndIndexesToField < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE field ADD PRIMARY KEY (field_id)"
  end
end
