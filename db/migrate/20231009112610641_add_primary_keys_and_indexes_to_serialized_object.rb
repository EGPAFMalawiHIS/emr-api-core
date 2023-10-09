# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the serialized_object table
class AddPrimaryKeysAndIndexesToSerializedObject < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE serialized_object ADD PRIMARY KEY (serialized_object_id)"
  end
end
