# frozen_string_literal: true

# Migration responsible for creating the concept_name table
class CreateConceptName < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_name, id: false do |t|
      t.bigint :concept_id, limit: 4
      t.string :name, null: false, default: '', limit: 255
      t.string :locale, null: false, default: '', limit: 50
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :concept_name_id, null: false, limit: 4
      t.boolean :voided, null: false, default: '0'
      t.bigint :voided_by, limit: 4
      t.datetime :date_voided
      t.string :void_reason, limit: 255
      t.string :uuid, null: false, limit: 38
      t.string :concept_name_type, limit: 50
      t.boolean :locale_preferred, default: '0'
      t.datetime :date_changed
      t.bigint :changed_by, limit: 4
    end
  end
end
