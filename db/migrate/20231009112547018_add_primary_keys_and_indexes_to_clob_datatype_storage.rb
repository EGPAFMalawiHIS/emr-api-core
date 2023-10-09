# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the clob_datatype_storage table
class AddPrimaryKeysAndIndexesToClobDatatypeStorage < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE clob_datatype_storage ADD PRIMARY KEY (id)"
  end
end
