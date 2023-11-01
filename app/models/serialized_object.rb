# frozen_string_literal: true

# Model: SerializedObject
class SerializedObject < ApplicationRecord
  self.table_name = 'serialized_object'
  self.primary_key = 'serialized_object_id'

  has_many :reporting_report_design, foreign_key: report_definition_id, primary_key: serialized_object_id
  validates :name, presence: true
  validates :type, presence: true
  validates :subtype, presence: true
  validates :serialization_class, presence: true
  validates :serialized_data, presence: true
  validates :date_created, presence: true
  validates :creator, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
