# frozen_string_literal: true

# Migration responsible for creating the person_merge_log table
class CreatePersonMergeLog < ActiveRecord::Migration[6.0]
  def change
    create_table :person_merge_log, id: false do |t|
      t.bigint :person_merge_log_id, null: false, limit: 4
      t.bigint :winner_person_id, null: false, limit: 4
      t.bigint :loser_person_id, null: false, limit: 4
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false
      t.text :merged_data, null: false, limit: 4294967295
      t.string :uuid, null: false, limit: 38
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.boolean :voided, null: false, default: '0'
      t.bigint :voided_by, limit: 4
      t.datetime :date_voided
      t.string :void_reason, limit: 255
    end
  end
end
