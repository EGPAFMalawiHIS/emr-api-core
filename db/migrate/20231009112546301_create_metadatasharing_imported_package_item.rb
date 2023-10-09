# frozen_string_literal: true

# Migration responsible for creating the metadatasharing_imported_package_item table
class CreateMetadatasharingImportedPackageItem < ActiveRecord::Migration[6.0]
  def change
    create_table :metadatasharing_imported_package_item, id: false do |t|
      t.bigint :imported_package_id, null: false, default: '0', limit: 4
      t.bigint :imported_item_id, null: false, default: '0', limit: 4
    end
  end
end
