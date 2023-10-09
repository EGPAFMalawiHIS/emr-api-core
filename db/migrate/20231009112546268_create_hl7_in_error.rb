# frozen_string_literal: true

# Migration responsible for creating the hl7_in_error table
class CreateHl7InError < ActiveRecord::Migration[6.0]
  def change
    create_table :hl7_in_error, id: false do |t|
      t.bigint :hl7_in_error_id, null: false, limit: 4
      t.bigint :hl7_source, null: false, default: '0', limit: 4
      t.text :hl7_source_key, limit: 65535
      t.text :hl7_data, null: false, limit: 16777215
      t.string :error, null: false, default: '', limit: 255
      t.text :error_details, limit: 16777215
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.string :uuid, null: false, limit: 38
    end
  end
end
