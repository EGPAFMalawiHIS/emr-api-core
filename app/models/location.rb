# frozen_string_literal: true

# Model: Location
class Location < ApplicationRecord
  self.table_name = 'location'
  self.primary_key = 'location_id'

  has_many :encounter, foreign_key: location_id, primary_key: location_id
  has_many :location, foreign_key: parent_location, primary_key: location_id
  has_many :location_attribute, foreign_key: location_id, primary_key: location_id
  has_many :location_tag_map, foreign_key: location_id, primary_key: location_id
  has_many :obs, foreign_key: location_id, primary_key: location_id
  has_many :patient_identifier, foreign_key: location_id, primary_key: location_id
  has_many :patient_program, foreign_key: location_id, primary_key: location_id
  has_many :visit, foreign_key: location_id, primary_key: location_id
  validates :name, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
