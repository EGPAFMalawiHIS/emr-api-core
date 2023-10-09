# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the privilege table
class AddPrimaryKeysAndIndexesToPrivilege < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE privilege ADD PRIMARY KEY (privilege)"
  end
end
