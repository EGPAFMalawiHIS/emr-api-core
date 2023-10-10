# frozen_string_literal: true

# Model: LocationTagMap
class LocationTagMap < ApplicationRecord
  self.table_name = 'location_tag_map'
  self.primary_key = '["location_id", "location_tag_id"]'

  validates :location_id, presence: true
  validates :location_tag_id, presence: true
end
