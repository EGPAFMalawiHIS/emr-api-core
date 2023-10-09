# frozen_string_literal: true

# Migration responsible for creating the care_setting table
class CreateCareSetting < ActiveRecord::Migration[6.0]
  def change
    create_table :care_setting, id: false do |t|
      t.bigint :care_setting_id, null: false, limit: 4
      t.string :name, null: false, limit: 255
      t.string :description, limit: 255
      t.string :care_setting_type, null: false, limit: 50
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false
      t.boolean :retired, null: false, default: '0'
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retire_reason, limit: 255
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.string :uuid, null: false, limit: 38
    end
  end
end
