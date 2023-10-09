# frozen_string_literal: true

# Migration responsible for creating the field_answer table
class CreateFieldAnswer < ActiveRecord::Migration[6.0]
  def change
    create_table :field_answer, id: false do |t|
      t.bigint :field_id, null: false, default: '0', limit: 4
      t.bigint :answer_id, null: false, default: '0', limit: 4
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.string :uuid, null: false, limit: 38
    end
  end
end
