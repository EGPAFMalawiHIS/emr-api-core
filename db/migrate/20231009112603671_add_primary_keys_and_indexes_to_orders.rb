# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the orders table
class AddPrimaryKeysAndIndexesToOrders < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE orders ADD PRIMARY KEY (order_id)"
  end
end
