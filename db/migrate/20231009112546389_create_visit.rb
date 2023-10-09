# frozen_string_literal: true

# Migration responsible for creating the visit table
class CreateVisit < ActiveRecord::Migration[6.0]
  def change
    create_table :visit, id: false do |t|
      t.bigint :visit_id, null: false, limit: 4
      t.bigint :patient_id, null: false, limit: 4
      t.bigint :visit_type_id, null: false, limit: 4
      t.datetime :date_started, null: false
      t.datetime :date_stopped
      t.bigint :indication_concept_id, limit: 4
      t.bigint :location_id, limit: 4
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false
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
