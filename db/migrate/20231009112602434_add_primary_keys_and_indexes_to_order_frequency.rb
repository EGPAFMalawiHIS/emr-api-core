# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the order_frequency table
class AddPrimaryKeysAndIndexesToOrderFrequency < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE order_frequency ADD PRIMARY KEY (order_frequency_id)"
  end
end
