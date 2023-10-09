# frozen_string_literal: true

# Migration responsible for creating the form table
class CreateForm < ActiveRecord::Migration[6.0]
  def change
    create_table :form, id: false do |t|
      t.bigint :form_id, null: false, limit: 4
      t.string :name, null: false, default: '', limit: 255
      t.string :version, null: false, default: '', limit: 50
      t.bigint :build, limit: 4
      t.boolean :published, null: false, default: '0'
      t.text :description, limit: 65535
      t.bigint :encounter_type, limit: 4
      t.text :template, limit: 16777215
      t.text :xslt, limit: 16777215
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.boolean :retired, null: false, default: '0'
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retired_reason, limit: 255
      t.string :uuid, null: false, limit: 38
    end
  end
end
