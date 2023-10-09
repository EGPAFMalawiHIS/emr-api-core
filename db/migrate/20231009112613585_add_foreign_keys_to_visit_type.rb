# frozen_string_literal: true

# Migration responsible for adding foreign keys to the visit_type table
class AddForeignKeysToVisitType < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :visit_type, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :visit_type, :users, column: :creator, primary_key: :user_id
    add_foreign_key :visit_type, :users, column: :retired_by, primary_key: :user_id
  end
end
