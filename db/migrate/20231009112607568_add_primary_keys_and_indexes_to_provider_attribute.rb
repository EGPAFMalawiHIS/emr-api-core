# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the provider_attribute table
class AddPrimaryKeysAndIndexesToProviderAttribute < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE provider_attribute ADD PRIMARY KEY (provider_attribute_id)"
  end
end
