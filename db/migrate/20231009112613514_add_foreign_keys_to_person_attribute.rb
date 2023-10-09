# frozen_string_literal: true

# Migration responsible for adding foreign keys to the person_attribute table
class AddForeignKeysToPersonAttribute < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :person_attribute, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :person_attribute, :users, column: :creator, primary_key: :user_id
    add_foreign_key :person_attribute, :users, column: :voided_by, primary_key: :user_id
    add_foreign_key :person_attribute, :person_attribute_type, column: :person_attribute_type_id, primary_key: :person_attribute_type_id
    add_foreign_key :person_attribute, :person, column: :person_id, primary_key: :person_id
  end
end
