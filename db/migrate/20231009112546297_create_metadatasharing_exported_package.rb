# frozen_string_literal: true

# Migration responsible for creating the metadatasharing_exported_package table
class CreateMetadatasharingExportedPackage < ActiveRecord::Migration[6.0]
  def change
    create_table :metadatasharing_exported_package, id: false do |t|
      t.bigint :exported_package_id, null: false, limit: 4
      t.string :uuid, null: false, limit: 38
      t.datetime :date_created, null: false
      t.string :name, null: false, limit: 64
      t.string :description, null: false, limit: 256
      t.binary :content, limit: 65535
    end
  end
end
