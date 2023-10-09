# frozen_string_literal: true

# Migration responsible for creating the hl7_in_archive table
class CreateHl7InArchive < ActiveRecord::Migration[6.0]
  def change
    create_table :hl7_in_archive, id: false do |t|
      t.bigint :hl7_in_archive_id, null: false, limit: 4
      t.bigint :hl7_source, null: false, default: '0', limit: 4
      t.string :hl7_source_key, limit: 255
      t.text :hl7_data, null: false, limit: 16777215
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :message_state, default: '0', limit: 4
      t.string :uuid, null: false, limit: 38
    end
  end
end
