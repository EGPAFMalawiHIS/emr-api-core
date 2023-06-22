class LocationTagMap < ApplicationRecord
  belongs_to :location
  belongs_to :location_tag
end
