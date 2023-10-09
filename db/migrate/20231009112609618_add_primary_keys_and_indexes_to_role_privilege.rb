# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the role_privilege table
class AddPrimaryKeysAndIndexesToRolePrivilege < ActiveRecord::Migration[6.0]
  def up
    add_index :role_privilege, %i[privilege role], unique: true
  end

  def down
    remove_index :role_privilege, %i[privilege role]
  end
end
