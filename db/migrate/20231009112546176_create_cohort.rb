# frozen_string_literal: true

# Migration responsible for creating the cohort table
class CreateCohort < ActiveRecord::Migration[6.0]
  def change
    create_table :cohort, id: false do |t|
      t.bigint :cohort_id, null: false, limit: 4
      t.string :name, null: false, limit: 255
      t.string :description, limit: 1000
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false
      t.boolean :voided, null: false, default: '0'
      t.bigint :voided_by, limit: 4
      t.datetime :date_voided
      t.string :void_reason, limit: 255
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.string :uuid, null: false, limit: 38
    end
  end
end
