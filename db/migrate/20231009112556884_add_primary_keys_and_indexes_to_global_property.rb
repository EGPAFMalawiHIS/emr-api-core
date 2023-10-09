# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the global_property table
class AddPrimaryKeysAndIndexesToGlobalProperty < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE global_property ADD PRIMARY KEY (property)"
  end
end
