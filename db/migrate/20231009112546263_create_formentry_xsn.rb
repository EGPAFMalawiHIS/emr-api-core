# frozen_string_literal: true

# Migration responsible for creating the formentry_xsn table
class CreateFormentryXsn < ActiveRecord::Migration[6.0]
  def change
    create_table :formentry_xsn, id: false do |t|
      t.bigint :formentry_xsn_id, null: false, limit: 4
      t.bigint :form_id, null: false, limit: 4
      t.binary :xsn_data, null: false, limit: 4294967295
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :archived, null: false, default: '0', limit: 4
      t.bigint :archived_by, limit: 4
      t.datetime :date_archived
      t.string :uuid, null: false, limit: 38
    end
  end
end
