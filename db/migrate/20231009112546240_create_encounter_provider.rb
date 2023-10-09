# frozen_string_literal: true

# Migration responsible for creating the encounter_provider table
class CreateEncounterProvider < ActiveRecord::Migration[6.0]
  def change
    create_table :encounter_provider, id: false do |t|
      t.bigint :encounter_provider_id, null: false, limit: 4
      t.bigint :encounter_id, null: false, limit: 4
      t.bigint :provider_id, null: false, limit: 4
      t.bigint :encounter_role_id, null: false, limit: 4
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.boolean :voided, null: false, default: '0'
      t.datetime :date_voided
      t.bigint :voided_by, limit: 4
      t.string :void_reason, limit: 255
      t.string :uuid, null: false, limit: 38
    end
  end
end
