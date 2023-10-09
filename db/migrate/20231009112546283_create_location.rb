# frozen_string_literal: true

# Migration responsible for creating the location table
class CreateLocation < ActiveRecord::Migration[6.0]
  def change
    create_table :location, id: false do |t|
      t.bigint :location_id, null: false, limit: 4
      t.string :name, null: false, default: '', limit: 255
      t.string :description, limit: 255
      t.string :address1, limit: 255
      t.string :address2, limit: 255
      t.string :city_village, limit: 255
      t.string :state_province, limit: 255
      t.string :postal_code, limit: 50
      t.string :country, limit: 50
      t.string :latitude, limit: 50
      t.string :longitude, limit: 50
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.string :county_district, limit: 255
      t.string :address3, limit: 255
      t.string :address6, limit: 255
      t.string :address5, limit: 255
      t.string :address4, limit: 255
      t.boolean :retired, null: false, default: '0'
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retire_reason, limit: 255
      t.bigint :parent_location, limit: 4
      t.string :uuid, null: false, limit: 38
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.string :address7, limit: 255
      t.string :address8, limit: 255
      t.string :address9, limit: 255
      t.string :address10, limit: 255
      t.string :address11, limit: 255
      t.string :address12, limit: 255
      t.string :address13, limit: 255
      t.string :address14, limit: 255
      t.string :address15, limit: 255
    end
  end
end
