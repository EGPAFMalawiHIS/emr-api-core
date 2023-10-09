# frozen_string_literal: true

# Migration responsible for adding foreign keys to the serialized_object table
class AddForeignKeysToSerializedObject < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :serialized_object, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :serialized_object, :users, column: :creator, primary_key: :user_id
    add_foreign_key :serialized_object, :users, column: :retired_by, primary_key: :user_id
  end
end
