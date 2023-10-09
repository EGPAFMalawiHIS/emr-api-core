# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the order_set table
class AddPrimaryKeysAndIndexesToOrderSet < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE order_set ADD PRIMARY KEY (order_set_id)"
  end
end
