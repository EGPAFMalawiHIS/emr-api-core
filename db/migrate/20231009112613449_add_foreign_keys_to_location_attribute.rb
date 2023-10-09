# frozen_string_literal: true

# Migration responsible for adding foreign keys to the location_attribute table
class AddForeignKeysToLocationAttribute < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :location_attribute, :location_attribute_type, column: :attribute_type_id, primary_key: :location_attribute_type_id
    add_foreign_key :location_attribute, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :location_attribute, :users, column: :creator, primary_key: :user_id
    add_foreign_key :location_attribute, :location, column: :location_id, primary_key: :location_id
    add_foreign_key :location_attribute, :users, column: :voided_by, primary_key: :user_id
  end
end
