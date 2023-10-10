# frozen_string_literal: true

# Model: LocationAttributeType
class LocationAttributeType < ApplicationRecord
  self.table_name = 'location_attribute_type'
  self.primary_key = 'location_attribute_type_id'

  has_many :location_attribute, foreign_key: attribute_type_id, primary_key: location_attribute_type_id
  validates :name, presence: true
  validates :min_occurs, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
