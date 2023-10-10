# frozen_string_literal: true

# Model: MetadatasharingExportedPackage
class MetadatasharingExportedPackage < ApplicationRecord
  self.table_name = 'metadatasharing_exported_package'
  self.primary_key = 'exported_package_id'

  validates :uuid, presence: true
  validates :date_created, presence: true
  validates :name, presence: true
  validates :description, presence: true
end
