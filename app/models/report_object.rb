# frozen_string_literal: true

# Model: ReportObject
class ReportObject < ApplicationRecord
  self.table_name = 'report_object'
  self.primary_key = 'report_object_id'

  validates :name, presence: true
  validates :report_object_type, presence: true
  validates :report_object_sub_type, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :uuid, presence: true
end
