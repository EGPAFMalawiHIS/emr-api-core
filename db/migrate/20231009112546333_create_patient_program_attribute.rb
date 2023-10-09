# frozen_string_literal: true

# Migration responsible for creating the patient_program_attribute table
class CreatePatientProgramAttribute < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_program_attribute, id: false do |t|
      t.bigint :patient_program_attribute_id, null: false, limit: 4
      t.bigint :patient_program_id, null: false, limit: 4
      t.bigint :attribute_type_id, null: false, limit: 4
      t.text :value_reference, null: false, limit: 65535
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
