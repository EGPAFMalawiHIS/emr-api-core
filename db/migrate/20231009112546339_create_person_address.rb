# frozen_string_literal: true

# Migration responsible for creating the person_address table
class CreatePersonAddress < ActiveRecord::Migration[6.0]
  def change
    create_table :person_address, id: false do |t|
      t.bigint :person_address_id, null: false, limit: 4
      t.bigint :person_id, limit: 4
      t.boolean :preferred, null: false, default: '0'
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
      t.boolean :voided, null: false, default: '0'
      t.bigint :voided_by, limit: 4
      t.datetime :date_voided
      t.string :void_reason, limit: 255
      t.string :county_district, limit: 255
      t.string :address3, limit: 255
      t.string :address6, limit: 255
      t.string :address5, limit: 255
      t.string :address4, limit: 255
      t.string :uuid, null: false, limit: 38
      t.datetime :date_changed
      t.bigint :changed_by, limit: 4
      t.datetime :start_date
      t.datetime :end_date
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
