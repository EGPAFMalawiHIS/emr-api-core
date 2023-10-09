# frozen_string_literal: true

# Migration responsible for creating the note table
class CreateNote < ActiveRecord::Migration[6.0]
  def change
    create_table :note, id: false do |t|
      t.bigint :note_id, null: false, default: '0', limit: 4
      t.string :note_type, limit: 50
      t.bigint :patient_id, limit: 4
      t.bigint :obs_id, limit: 4
      t.bigint :encounter_id, limit: 4
      t.text :text, null: false, limit: 65535
      t.bigint :priority, limit: 4
      t.bigint :parent, limit: 4
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.string :uuid, null: false, limit: 38
    end
  end
end
