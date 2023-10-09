# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the order_group table
class AddPrimaryKeysAndIndexesToOrderGroup < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE order_group ADD PRIMARY KEY (order_group_id)"
  end
end
