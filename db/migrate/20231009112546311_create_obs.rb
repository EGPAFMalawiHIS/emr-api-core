# frozen_string_literal: true

# Migration responsible for creating the obs table
class CreateObs < ActiveRecord::Migration[6.0]
  def change
    create_table :obs, id: false do |t|
      t.bigint :obs_id, null: false, limit: 4
      t.bigint :person_id, null: false, limit: 4
      t.bigint :concept_id, null: false, default: '0', limit: 4
      t.bigint :encounter_id, limit: 4
      t.bigint :order_id, limit: 4
      t.datetime :obs_datetime, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :location_id, limit: 4
      t.bigint :obs_group_id, limit: 4
      t.string :accession_number, limit: 255
      t.bigint :value_group_id, limit: 4
      t.bigint :value_coded, limit: 4
      t.bigint :value_coded_name_id, limit: 4
      t.bigint :value_drug, limit: 4
      t.datetime :value_datetime
      t.float :value_numeric, limit: 53
      t.string :value_modifier, limit: 2
      t.text :value_text, limit: 65535
      t.string :comments, limit: 255
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.boolean :voided, null: false, default: '0'
      t.bigint :voided_by, limit: 4
      t.datetime :date_voided
      t.string :void_reason, limit: 255
      t.string :value_complex, limit: 1000
      t.string :uuid, null: false, limit: 38
      t.bigint :previous_version, limit: 4
      t.string :form_namespace_and_path, limit: 255
      t.string :status, null: false, default: '', limit: 16
      t.string :interpretation, limit: 32
    end
  end
end
