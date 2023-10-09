# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the metadatasharing_imported_package table
class AddPrimaryKeysAndIndexesToMetadatasharingImportedPackage < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE metadatasharing_imported_package ADD PRIMARY KEY (imported_package_id)"
  end
end
