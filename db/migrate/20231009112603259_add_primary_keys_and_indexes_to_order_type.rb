# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the order_type table
class AddPrimaryKeysAndIndexesToOrderType < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE order_type ADD PRIMARY KEY (order_type_id)"
  end
end
