# frozen_string_literal: true

# Migration responsible for creating the patient_identifier table
class CreatePatientIdentifier < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_identifier, id: false do |t|
      t.bigint :patient_identifier_id, null: false, limit: 4
      t.bigint :patient_id, null: false, default: '0', limit: 4
      t.string :identifier, null: false, default: '', limit: 50
      t.bigint :identifier_type, null: false, default: '0', limit: 4
      t.boolean :preferred, null: false, default: '0'
      t.bigint :location_id, limit: 4
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.boolean :voided, null: false, default: '0'
      t.bigint :voided_by, limit: 4
      t.datetime :date_voided
      t.string :void_reason, limit: 255
      t.string :uuid, null: false, limit: 38
      t.datetime :date_changed
      t.bigint :changed_by, limit: 4
    end
  end
end
