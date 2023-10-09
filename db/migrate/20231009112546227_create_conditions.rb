# frozen_string_literal: true

# Migration responsible for creating the conditions table
class CreateConditions < ActiveRecord::Migration[6.0]
  def change
    create_table :conditions, id: false do |t|
      t.bigint :condition_id, null: false, limit: 4
      t.string :additional_detail, limit: 255
      t.bigint :previous_version, limit: 4
      t.bigint :condition_coded, limit: 4
      t.string :condition_non_coded, limit: 255
      t.bigint :condition_coded_name, limit: 4
      t.string :clinical_status, null: false, limit: 50
      t.string :verification_status, limit: 50
      t.datetime :onset_date
      t.datetime :date_created, null: false
      t.boolean :voided, null: false, default: '0'
      t.datetime :date_voided
      t.string :void_reason, limit: 255
      t.string :uuid, limit: 38
      t.bigint :creator, null: false, limit: 4
      t.bigint :voided_by, limit: 4
      t.bigint :changed_by, limit: 4
      t.bigint :patient_id, null: false, limit: 4
      t.datetime :end_date
    end
  end
end
