class LocationAttribute < ApplicationRecord
  belongs_to :location
  belongs_to :attribute_type
end
