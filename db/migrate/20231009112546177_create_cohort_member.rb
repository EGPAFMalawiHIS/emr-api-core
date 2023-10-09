# frozen_string_literal: true

# Migration responsible for creating the cohort_member table
class CreateCohortMember < ActiveRecord::Migration[6.0]
  def change
    create_table :cohort_member, id: false do |t|
      t.bigint :cohort_id, null: false, limit: 4
      t.bigint :patient_id, null: false, limit: 4
      t.bigint :cohort_member_id, null: false, limit: 4
      t.datetime :start_date, null: false
      t.datetime :end_date
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false
      t.boolean :voided, null: false, default: '0'
      t.bigint :voided_by, limit: 4
      t.datetime :date_voided
      t.string :void_reason, limit: 255
      t.string :uuid, null: false, limit: 38
    end
  end
end
