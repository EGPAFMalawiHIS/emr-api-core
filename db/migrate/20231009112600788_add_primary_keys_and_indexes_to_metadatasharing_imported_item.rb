# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the metadatasharing_imported_item table
class AddPrimaryKeysAndIndexesToMetadatasharingImportedItem < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE metadatasharing_imported_item ADD PRIMARY KEY (imported_item_id)"
  end
end
