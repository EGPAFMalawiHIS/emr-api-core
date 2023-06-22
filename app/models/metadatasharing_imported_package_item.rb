class MetadatasharingImportedPackageItem < ApplicationRecord
  belongs_to :imported_package
  belongs_to :imported_item
end
