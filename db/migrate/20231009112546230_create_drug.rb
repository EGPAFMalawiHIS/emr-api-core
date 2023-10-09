# frozen_string_literal: true

# Migration responsible for creating the drug table
class CreateDrug < ActiveRecord::Migration[6.0]
  def change
    create_table :drug, id: false do |t|
      t.bigint :drug_id, null: false, limit: 4
      t.bigint :concept_id, null: false, default: '0', limit: 4
      t.string :name, limit: 255
      t.boolean :combination, null: false, default: '0'
      t.bigint :dosage_form, limit: 4
      t.float :maximum_daily_dose, limit: 53
      t.float :minimum_daily_dose, limit: 53
      t.bigint :route, limit: 4
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.boolean :retired, null: false, default: '0'
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retire_reason, limit: 255
      t.string :uuid, null: false, limit: 38
      t.datetime :date_changed
      t.bigint :changed_by, limit: 4
      t.string :strength, limit: 255
    end
  end
end
