# frozen_string_literal: true

# Migration responsible for creating the reporting_report_design_resource table
class CreateReportingReportDesignResource < ActiveRecord::Migration[6.0]
  def change
    create_table :reporting_report_design_resource, id: false do |t|
      t.bigint :id, null: false, limit: 4
      t.string :uuid, null: false, limit: 38
      t.string :name, null: false, limit: 255
      t.string :description, limit: 1000
      t.bigint :report_design_id, null: false, default: '0', limit: 4
      t.string :content_type, limit: 50
      t.string :extension, limit: 20
      t.binary :contents, limit: 4294967295
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
