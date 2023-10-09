# frozen_string_literal: true

# Migration responsible for adding foreign keys to the cohort table
class AddForeignKeysToCohort < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :cohort, :users, column: :creator, primary_key: :user_id
    add_foreign_key :cohort, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :cohort, :users, column: :voided_by, primary_key: :user_id
  end
end
