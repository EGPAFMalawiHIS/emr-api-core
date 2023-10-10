# frozen_string_literal: true

# Model: ReportingReportRequest
class ReportingReportRequest < ApplicationRecord
  self.table_name = 'reporting_report_request'
  self.primary_key = 'id'

  validates :uuid, presence: true
  validates :report_definition_uuid, presence: true
  validates :renderer_type, presence: true
  validates :requested_by, presence: true
  validates :request_datetime, presence: true
  validates :priority, presence: true
  validates :status, presence: true
end
