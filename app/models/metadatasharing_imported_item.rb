# frozen_string_literal: true

# Model: MetadatasharingImportedItem
class MetadatasharingImportedItem < ApplicationRecord
  self.table_name = 'metadatasharing_imported_item'
  self.primary_key = 'imported_item_id'

  validates :uuid, presence: true
  validates :itemUuid, presence: true
end
