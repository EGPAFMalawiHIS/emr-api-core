# frozen_string_literal: true

# Migration responsible for creating the hl7_in_queue table
class CreateHl7InQueue < ActiveRecord::Migration[6.0]
  def change
    create_table :hl7_in_queue, id: false do |t|
      t.bigint :hl7_in_queue_id, null: false, limit: 4
      t.bigint :hl7_source, null: false, default: '0', limit: 4
      t.text :hl7_source_key, limit: 65535
      t.text :hl7_data, null: false, limit: 16777215
      t.bigint :message_state, null: false, default: '0', limit: 4
      t.datetime :date_processed
      t.text :error_msg, limit: 65535
      t.datetime :date_created
      t.string :uuid, null: false, limit: 38
    end
  end
end
