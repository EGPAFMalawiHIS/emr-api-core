# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the test_order table
class AddPrimaryKeysAndIndexesToTestOrder < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE test_order ADD PRIMARY KEY (order_id)"
  end
end
