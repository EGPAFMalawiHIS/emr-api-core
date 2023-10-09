# frozen_string_literal: true

# Migration responsible for creating the hl7_source table
class CreateHl7Source < ActiveRecord::Migration[6.0]
  def change
    create_table :hl7_source, id: false do |t|
      t.bigint :hl7_source_id, null: false, limit: 4
      t.string :name, null: false, default: '', limit: 255
      t.text :description, limit: 255
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.string :uuid, null: false, limit: 38
    end
  end
end
