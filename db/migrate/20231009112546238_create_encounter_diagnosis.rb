# frozen_string_literal: true

# Migration responsible for creating the encounter_diagnosis table
class CreateEncounterDiagnosis < ActiveRecord::Migration[6.0]
  def change
    create_table :encounter_diagnosis, id: false do |t|
      t.bigint :diagnosis_id, null: false, limit: 4
      t.bigint :diagnosis_coded, limit: 4
      t.string :diagnosis_non_coded, limit: 255
      t.bigint :diagnosis_coded_name, limit: 4
      t.bigint :encounter_id, null: false, limit: 4
      t.bigint :patient_id, null: false, limit: 4
      t.bigint :condition_id, limit: 4
      t.string :certainty, null: false, limit: 255
      t.bigint :rank, null: false, limit: 4
      t.string :uuid, null: false, limit: 38
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.boolean :voided, null: false, default: '0'
      t.bigint :voided_by, limit: 4
      t.datetime :date_voided
      t.string :void_reason, limit: 255
    end
  end
end
