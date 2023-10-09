# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the user_property table
class AddPrimaryKeysAndIndexesToUserProperty < ActiveRecord::Migration[6.0]
  def up
    add_index :user_property, %i[user_id property], unique: true
  end

  def down
    remove_index :user_property, %i[user_id property]
  end
end
