# frozen_string_literal: true

# Migration responsible for creating the encounter_role table
class CreateEncounterRole < ActiveRecord::Migration[6.0]
  def change
    create_table :encounter_role, id: false do |t|
      t.bigint :encounter_role_id, null: false, limit: 4
      t.string :name, null: false, limit: 255
      t.string :description, limit: 1024
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.boolean :retired, null: false, default: '0'
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retire_reason, limit: 255
      t.string :uuid, null: false, limit: 38
    end
  end
end
