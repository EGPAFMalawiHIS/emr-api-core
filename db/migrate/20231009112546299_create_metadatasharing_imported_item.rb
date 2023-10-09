# frozen_string_literal: true

# Migration responsible for creating the metadatasharing_imported_item table
class CreateMetadatasharingImportedItem < ActiveRecord::Migration[6.0]
  def change
    create_table :metadatasharing_imported_item, id: false do |t|
      t.bigint :imported_item_id, null: false, limit: 4
      t.string :uuid, null: false, limit: 38
      t.string :itemUuid, null: false, limit: 38
    end
  end
end
