# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the users table
class AddPrimaryKeysAndIndexesToUsers < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE users ADD PRIMARY KEY (user_id)"
  end
end
