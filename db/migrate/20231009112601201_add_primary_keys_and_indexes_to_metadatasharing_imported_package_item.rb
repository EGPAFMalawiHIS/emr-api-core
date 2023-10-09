# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the metadatasharing_imported_package_item table
class AddPrimaryKeysAndIndexesToMetadatasharingImportedPackageItem < ActiveRecord::Migration[6.0]
  def up
    add_index :metadatasharing_imported_package_item, %i[imported_package_id imported_item_id], unique: true, name: 'index_imported_package_item'
  end

  def down
    remove_index :metadatasharing_imported_package_item, %i[imported_package_id imported_item_id]
  end
end
