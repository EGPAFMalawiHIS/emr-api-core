# frozen_string_literal: true

# Model: LocationTagMap
class LocationTagMap < ApplicationRecord
  self.table_name = 'location_tag_map'
  self.primary_key = '["location_id", "location_tag_id"]'

  belongs_to :location, class_name: 'Location', foreign_key: :location_id, primary_key: :location_id, optional: true
  belongs_to :location_tag, class_name: 'LocationTag', foreign_key: :location_tag_id, primary_key: :location_tag_id, optional: true

  validates :location_id, presence: true
  validates :location_tag_id, presence: true
end
