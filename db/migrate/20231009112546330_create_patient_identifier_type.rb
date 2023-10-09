# frozen_string_literal: true

# Migration responsible for creating the patient_identifier_type table
class CreatePatientIdentifierType < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_identifier_type, id: false do |t|
      t.bigint :patient_identifier_type_id, null: false, limit: 4
      t.string :name, null: false, default: '', limit: 50
      t.text :description, limit: 65535
      t.string :format, limit: 255
      t.boolean :check_digit, null: false, default: '0'
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.boolean :required, null: false, default: '0'
      t.string :format_description, limit: 255
      t.string :validator, limit: 200
      t.boolean :retired, null: false, default: '0'
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retire_reason, limit: 255
      t.string :uuid, null: false, limit: 38
      t.string :location_behavior, limit: 50
      t.string :uniqueness_behavior, limit: 50
      t.datetime :date_changed
      t.bigint :changed_by, limit: 4
    end
  end
end
