# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the metadatasharing_exported_package table
class AddPrimaryKeysAndIndexesToMetadatasharingExportedPackage < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE metadatasharing_exported_package ADD PRIMARY KEY (exported_package_id)"
  end
end
