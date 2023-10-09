# frozen_string_literal: true

# Migration responsible for creating the location_tag_map table
class CreateLocationTagMap < ActiveRecord::Migration[6.0]
  def change
    create_table :location_tag_map, id: false do |t|
      t.bigint :location_id, null: false, limit: 4
      t.bigint :location_tag_id, null: false, limit: 4
    end
  end
end
