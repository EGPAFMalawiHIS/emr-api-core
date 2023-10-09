# frozen_string_literal: true

# Migration responsible for creating the formentry_archive table
class CreateFormentryArchive < ActiveRecord::Migration[6.0]
  def change
    create_table :formentry_archive, id: false do |t|
      t.bigint :formentry_archive_id, null: false, limit: 4
      t.text :form_data, null: false, limit: 16777215
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :creator, null: false, default: '0', limit: 4
    end
  end
end
