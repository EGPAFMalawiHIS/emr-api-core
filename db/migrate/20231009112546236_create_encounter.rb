# frozen_string_literal: true

# Migration responsible for creating the encounter table
class CreateEncounter < ActiveRecord::Migration[6.0]
  def change
    create_table :encounter, id: false do |t|
      t.bigint :encounter_id, null: false, limit: 4
      t.bigint :encounter_type, null: false, limit: 4
      t.bigint :patient_id, null: false, default: '0', limit: 4
      t.bigint :location_id, limit: 4
      t.bigint :form_id, limit: 4
      t.datetime :encounter_datetime, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.boolean :voided, null: false, default: '0'
      t.bigint :voided_by, limit: 4
      t.datetime :date_voided
      t.string :void_reason, limit: 255
      t.string :uuid, null: false, limit: 38
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.bigint :visit_id, limit: 4
    end
  end
end
