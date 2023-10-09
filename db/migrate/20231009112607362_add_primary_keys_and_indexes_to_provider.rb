# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the provider table
class AddPrimaryKeysAndIndexesToProvider < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE provider ADD PRIMARY KEY (provider_id)"
  end
end
