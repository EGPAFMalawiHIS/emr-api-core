# frozen_string_literal: true

# Model: ReportingReportDesign
class ReportingReportDesign < ApplicationRecord
  self.table_name = 'reporting_report_design'
  self.primary_key = 'id'

  has_many :reporting_report_design_resource, foreign_key: report_design_id, primary_key: id
  validates :uuid, presence: true
  validates :name, presence: true
  validates :report_definition_id, presence: true
  validates :renderer_type, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
end
