# frozen_string_literal: true

# Migration responsible for adding foreign keys to the role_privilege table
class AddForeignKeysToRolePrivilege < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :role_privilege, :privilege, column: :privilege, primary_key: :privilege
    add_foreign_key :role_privilege, :role, column: :role, primary_key: :role
  end
end
