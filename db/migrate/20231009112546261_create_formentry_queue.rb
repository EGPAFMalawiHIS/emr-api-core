# frozen_string_literal: true

# Migration responsible for creating the formentry_queue table
class CreateFormentryQueue < ActiveRecord::Migration[6.0]
  def change
    create_table :formentry_queue, id: false do |t|
      t.bigint :formentry_queue_id, null: false, limit: 4
      t.text :form_data, null: false, limit: 16777215
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
    end
  end
end
