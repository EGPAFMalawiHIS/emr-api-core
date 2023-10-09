# frozen_string_literal: true

# Migration responsible for creating the concept table
class CreateConcept < ActiveRecord::Migration[6.0]
  def change
    create_table :concept, id: false do |t|
      t.bigint :concept_id, null: false, limit: 4
      t.boolean :retired, null: false, default: '0'
      t.string :short_name, limit: 255
      t.text :description, limit: 65535
      t.text :form_text, limit: 65535
      t.bigint :datatype_id, null: false, default: '0', limit: 4
      t.bigint :class_id, null: false, default: '0', limit: 4
      t.boolean :is_set, null: false, default: '0'
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.string :version, limit: 50
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retire_reason, limit: 255
      t.string :uuid, null: false, limit: 38
    end
  end
end
