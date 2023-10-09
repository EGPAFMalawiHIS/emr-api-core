# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the role table
class AddPrimaryKeysAndIndexesToRole < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE role ADD PRIMARY KEY (role)"
  end
end
