# frozen_string_literal: true

# Migration responsible for creating the location_tag table
class CreateLocationTag < ActiveRecord::Migration[6.0]
  def change
    create_table :location_tag, id: false do |t|
      t.bigint :location_tag_id, null: false, limit: 4
      t.string :name, limit: 50
      t.string :description, limit: 255
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false
      t.boolean :retired, null: false, default: '0'
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retire_reason, limit: 255
      t.string :uuid, null: false, limit: 38
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
    end
  end
end
