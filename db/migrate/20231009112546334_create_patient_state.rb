# frozen_string_literal: true

# Migration responsible for creating the patient_state table
class CreatePatientState < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_state, id: false do |t|
      t.bigint :patient_state_id, null: false, limit: 4
      t.bigint :patient_program_id, null: false, default: '0', limit: 4
      t.bigint :state, null: false, default: '0', limit: 4
      t.date :start_date
      t.date :end_date
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.boolean :voided, null: false, default: '0'
      t.bigint :voided_by, limit: 4
      t.datetime :date_voided
      t.string :void_reason, limit: 255
      t.string :uuid, null: false, limit: 38
    end
  end
end
