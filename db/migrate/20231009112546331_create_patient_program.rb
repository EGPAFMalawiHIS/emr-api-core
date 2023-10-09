# frozen_string_literal: true

# Migration responsible for creating the patient_program table
class CreatePatientProgram < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_program, id: false do |t|
      t.bigint :patient_program_id, null: false, limit: 4
      t.bigint :patient_id, null: false, default: '0', limit: 4
      t.bigint :program_id, null: false, default: '0', limit: 4
      t.datetime :date_enrolled
      t.datetime :date_completed
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.boolean :voided, null: false, default: '0'
      t.bigint :voided_by, limit: 4
      t.datetime :date_voided
      t.string :void_reason, limit: 255
      t.string :uuid, null: false, limit: 38
      t.bigint :location_id, limit: 4
      t.bigint :outcome_concept_id, limit: 4
    end
  end
end
