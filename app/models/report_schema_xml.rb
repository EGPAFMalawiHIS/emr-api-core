# frozen_string_literal: true

# Model: ReportSchemaXml
class ReportSchemaXml < ApplicationRecord
  self.table_name = 'report_schema_xml'
  self.primary_key = 'report_schema_id'

  validates :name, presence: true
  validates :description, presence: true
  validates :xml_data, presence: true
  validates :uuid, presence: true
end
