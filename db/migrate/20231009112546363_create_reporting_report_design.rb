# frozen_string_literal: true

# Migration responsible for creating the reporting_report_design table
class CreateReportingReportDesign < ActiveRecord::Migration[6.0]
  def change
    create_table :reporting_report_design, id: false do |t|
      t.bigint :id, null: false, limit: 4
      t.string :uuid, null: false, limit: 38
      t.string :name, null: false, limit: 255
      t.string :description, limit: 1000
      t.bigint :report_definition_id, null: false, default: '0', limit: 4
      t.string :renderer_type, null: false, limit: 255
      t.text :properties, limit: 65535
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.boolean :retired, null: false, default: '0'
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retire_reason, limit: 255
    end
  end
end
