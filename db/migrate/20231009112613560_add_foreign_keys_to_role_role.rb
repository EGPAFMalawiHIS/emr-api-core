# frozen_string_literal: true

# Migration responsible for adding foreign keys to the role_role table
class AddForeignKeysToRoleRole < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :role_role, :role, column: :child_role, primary_key: :role
    add_foreign_key :role_role, :role, column: :parent_role, primary_key: :role
  end
end
