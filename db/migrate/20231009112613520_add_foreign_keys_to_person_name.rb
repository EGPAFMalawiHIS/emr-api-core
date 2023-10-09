# frozen_string_literal: true

# Migration responsible for adding foreign keys to the person_name table
class AddForeignKeysToPersonName < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :person_name, :person, column: :person_id, primary_key: :person_id
    add_foreign_key :person_name, :users, column: :creator, primary_key: :user_id
    add_foreign_key :person_name, :users, column: :voided_by, primary_key: :user_id
  end
end
