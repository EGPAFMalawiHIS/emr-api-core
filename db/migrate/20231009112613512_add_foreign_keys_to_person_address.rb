# frozen_string_literal: true

# Migration responsible for adding foreign keys to the person_address table
class AddForeignKeysToPersonAddress < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :person_address, :person, column: :person_id, primary_key: :person_id
    add_foreign_key :person_address, :users, column: :creator, primary_key: :user_id
    add_foreign_key :person_address, :users, column: :voided_by, primary_key: :user_id
    add_foreign_key :person_address, :users, column: :changed_by, primary_key: :user_id
  end
end
