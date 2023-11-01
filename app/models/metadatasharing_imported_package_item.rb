# frozen_string_literal: true

# Model: MetadatasharingImportedPackageItem
class MetadatasharingImportedPackageItem < ApplicationRecord
  self.table_name = 'metadatasharing_imported_package_item'
  self.primary_key = '["imported_package_id", "imported_item_id"]'

  validates :imported_package_id, presence: true
  validates :imported_item_id, presence: true
end
