# frozen_string_literal: true

# Migration responsible for adding foreign keys to the person table
class AddForeignKeysToPerson < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :person, :concept, column: :cause_of_death, primary_key: :concept_id
    add_foreign_key :person, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :person, :users, column: :creator, primary_key: :user_id
    add_foreign_key :person, :users, column: :voided_by, primary_key: :user_id
  end
end
