# frozen_string_literal: true

# Model: RoomTemperature
class RoomTemperature < ApplicationRecord
  self.table_name = 'room_temperature'
  self.primary_key = 'room_temperature_id'

  validates :time, presence: true
  validates :temp, presence: true
  validates :uuid, presence: true
end
