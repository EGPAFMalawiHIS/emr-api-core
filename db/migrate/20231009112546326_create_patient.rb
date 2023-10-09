# frozen_string_literal: true

# Migration responsible for creating the patient table
class CreatePatient < ActiveRecord::Migration[6.0]
  def change
    create_table :patient, id: false do |t|
      t.bigint :patient_id, null: false, limit: 4
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.boolean :voided, null: false, default: '0'
      t.bigint :voided_by, limit: 4
      t.datetime :date_voided
      t.string :void_reason, limit: 255
      t.string :allergy_status, null: false, default: '', limit: 50
    end
  end
end
