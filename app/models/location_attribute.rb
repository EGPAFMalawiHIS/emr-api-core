# frozen_string_literal: true

# Model: LocationAttribute
class LocationAttribute < ApplicationRecord
  self.table_name = 'location_attribute'
  self.primary_key = 'location_attribute_id'

  validates :location_id, presence: true
  validates :attribute_type_id, presence: true
  validates :value_reference, presence: true
  validates :uuid, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
end
