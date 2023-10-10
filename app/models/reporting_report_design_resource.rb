# frozen_string_literal: true

# Model: ReportingReportDesignResource
class ReportingReportDesignResource < ApplicationRecord
  self.table_name = 'reporting_report_design_resource'
  self.primary_key = 'id'

  validates :uuid, presence: true
  validates :name, presence: true
  validates :report_design_id, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
end
