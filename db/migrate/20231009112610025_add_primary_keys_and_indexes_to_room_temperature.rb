# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the room_temperature table
class AddPrimaryKeysAndIndexesToRoomTemperature < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE room_temperature ADD PRIMARY KEY (room_temperature_id)"
  end
end
