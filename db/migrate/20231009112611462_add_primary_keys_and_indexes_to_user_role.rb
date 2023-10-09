# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the user_role table
class AddPrimaryKeysAndIndexesToUserRole < ActiveRecord::Migration[6.0]
  def up
    add_index :user_role, %i[role user_id], unique: true
  end

  def down
    remove_index :user_role, %i[role user_id]
  end
end
