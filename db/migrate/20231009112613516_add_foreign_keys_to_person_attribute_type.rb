# frozen_string_literal: true

# Migration responsible for adding foreign keys to the person_attribute_type table
class AddForeignKeysToPersonAttributeType < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :person_attribute_type, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :person_attribute_type, :users, column: :creator, primary_key: :user_id
    add_foreign_key :person_attribute_type, :privilege, column: :edit_privilege, primary_key: :privilege
    add_foreign_key :person_attribute_type, :users, column: :retired_by, primary_key: :user_id
  end
end
