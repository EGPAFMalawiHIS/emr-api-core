# frozen_string_literal: true

# Migration responsible for adding foreign keys to the field_type table
class AddForeignKeysToFieldType < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :field_type, :users, column: :creator, primary_key: :user_id
  end
end
