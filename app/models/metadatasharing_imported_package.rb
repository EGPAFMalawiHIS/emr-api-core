# frozen_string_literal: true

# Model: MetadatasharingImportedPackage
class MetadatasharingImportedPackage < ApplicationRecord
  self.table_name = 'metadatasharing_imported_package'
  self.primary_key = 'imported_package_id'

  validates :uuid, presence: true
  validates :package_uuid, presence: true
  validates :date_created, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :date_imported, presence: true
end
