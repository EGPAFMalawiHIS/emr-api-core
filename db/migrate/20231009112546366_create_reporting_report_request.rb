# frozen_string_literal: true

# Migration responsible for creating the reporting_report_request table
class CreateReportingReportRequest < ActiveRecord::Migration[6.0]
  def change
    create_table :reporting_report_request, id: false do |t|
      t.bigint :id, null: false, limit: 4
      t.string :uuid, null: false, limit: 38
      t.string :base_cohort_uuid, limit: 38
      t.text :base_cohort_parameters, limit: 65535
      t.string :report_definition_uuid, null: false, limit: 38
      t.text :report_definition_parameters, limit: 65535
      t.string :renderer_type, null: false, limit: 255
      t.string :renderer_argument, limit: 255
      t.bigint :requested_by, null: false, default: '0', limit: 4
      t.datetime :request_datetime, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.string :priority, null: false, limit: 255
      t.string :status, null: false, limit: 255
      t.datetime :evaluation_start_datetime
      t.datetime :evaluation_complete_datetime
      t.datetime :render_complete_datetime
      t.string :description, limit: 1000
    end
  end
end
