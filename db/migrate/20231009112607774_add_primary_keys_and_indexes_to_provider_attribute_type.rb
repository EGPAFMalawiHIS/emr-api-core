# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the provider_attribute_type table
class AddPrimaryKeysAndIndexesToProviderAttributeType < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE provider_attribute_type ADD PRIMARY KEY (provider_attribute_type_id)"
  end
end
