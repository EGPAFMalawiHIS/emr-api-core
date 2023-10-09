# frozen_string_literal: true

# Migration responsible for creating the drug_reference_map table
class CreateDrugReferenceMap < ActiveRecord::Migration[6.0]
  def change
    create_table :drug_reference_map, id: false do |t|
      t.bigint :drug_reference_map_id, null: false, limit: 4
      t.bigint :drug_id, null: false, limit: 4
      t.bigint :term_id, null: false, limit: 4
      t.bigint :concept_map_type, null: false, limit: 4
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false
      t.boolean :retired, null: false, default: '0'
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retire_reason, limit: 255
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.string :uuid, null: false, limit: 38
    end
  end
end
