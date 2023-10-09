# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the formentry_queue table
class AddPrimaryKeysAndIndexesToFormentryQueue < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE formentry_queue ADD PRIMARY KEY (formentry_queue_id)"
  end
end
