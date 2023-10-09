# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the order_set_member table
class AddPrimaryKeysAndIndexesToOrderSetMember < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE order_set_member ADD PRIMARY KEY (order_set_member_id)"
  end
end
