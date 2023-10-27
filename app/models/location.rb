# frozen_string_literal: true

# Model: Location
class Location < ApplicationRecord
  self.table_name = 'location'
  self.primary_key = 'location_id'

  has_many :location, foreign_key: :parent_location, primary_key: :location_id
  has_many :location_attribute, foreign_key: :location_id, primary_key: :location_id
  has_many :location_tag_map, foreign_key: :location_id, primary_key: :location_id

  validates :name, :creator, :date_created, :retired, :uuid, presence: true

  def self.current_location
    GlobalProperty.find_by_property('current_health_center_id').property_value
  end
end
