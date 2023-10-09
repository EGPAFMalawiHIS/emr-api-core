# frozen_string_literal: true

# Migration responsible for creating the formentry_error table
class CreateFormentryError < ActiveRecord::Migration[6.0]
  def change
    create_table :formentry_error, id: false do |t|
      t.bigint :formentry_error_id, null: false, limit: 4
      t.text :form_data, null: false, limit: 16777215
      t.string :error, null: false, default: '', limit: 255
      t.text :error_details, limit: 65535
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
    end
  end
end
