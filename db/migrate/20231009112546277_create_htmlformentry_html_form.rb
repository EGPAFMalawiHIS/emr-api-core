# frozen_string_literal: true

# Migration responsible for creating the htmlformentry_html_form table
class CreateHtmlformentryHtmlForm < ActiveRecord::Migration[6.0]
  def change
    create_table :htmlformentry_html_form, id: false do |t|
      t.bigint :id, null: false, limit: 4
      t.bigint :form_id, limit: 4
      t.string :name, limit: 255
      t.text :xml_data, null: false, limit: 16777215
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.boolean :retired, null: false, default: '0'
      t.string :uuid, null: false, limit: 38
      t.string :description, limit: 1000
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retire_reason, limit: 255
    end
  end
end
