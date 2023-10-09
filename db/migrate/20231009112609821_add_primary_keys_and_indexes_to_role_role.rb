# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the role_role table
class AddPrimaryKeysAndIndexesToRoleRole < ActiveRecord::Migration[6.0]
  def up
    add_index :role_role, %i[parent_role child_role], unique: true
  end

  def down
    remove_index :role_role, %i[parent_role child_role]
  end
end
