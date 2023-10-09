# frozen_string_literal: true

# Migration responsible for creating the allergy table
class CreateAllergy < ActiveRecord::Migration[6.0]
  def change
    create_table :allergy, id: false do |t|
      t.bigint :allergy_id, null: false, limit: 4
      t.bigint :patient_id, null: false, limit: 4
      t.bigint :severity_concept_id, limit: 4
      t.bigint :coded_allergen, null: false, limit: 4
      t.string :non_coded_allergen, limit: 255
      t.string :allergen_type, null: false, limit: 50
      t.string :comment, limit: 1024
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.boolean :voided, null: false, default: '0'
      t.bigint :voided_by, limit: 4
      t.datetime :date_voided
      t.string :void_reason, limit: 255
      t.string :uuid, limit: 38
    end
  end
end
