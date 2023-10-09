# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the conditions table
class AddPrimaryKeysAndIndexesToConditions < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE conditions ADD PRIMARY KEY (condition_id)"
  end
end
