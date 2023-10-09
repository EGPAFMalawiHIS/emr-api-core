# frozen_string_literal: true

# Migration responsible for creating the metadatasharing_imported_package table
class CreateMetadatasharingImportedPackage < ActiveRecord::Migration[6.0]
  def change
    create_table :metadatasharing_imported_package, id: false do |t|
      t.bigint :imported_package_id, null: false, limit: 4
      t.string :uuid, null: false, limit: 38
      t.string :package_uuid, null: false, limit: 38
      t.datetime :date_created, null: false
      t.string :name, null: false, limit: 64
      t.string :description, null: false, limit: 256
      t.datetime :date_imported, null: false
    end
  end
end
