# frozen_string_literal: true

# Migration responsible for creating the room_temperature table
class CreateRoomTemperature < ActiveRecord::Migration[6.0]
  def change
    create_table :room_temperature, id: false do |t|
      t.bigint :room_temperature_id, null: false, limit: 4
      t.datetime :time, null: false
      t.bigint :temp, null: false, limit: 4
      t.string :uuid, null: false, limit: 38
    end
  end
end
