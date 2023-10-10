# frozen_string_literal: true

# Model: FieldType
class FieldType < ApplicationRecord
  self.table_name = 'field_type'
  self.primary_key = 'field_type_id'

  has_many :field, foreign_key: field_type, primary_key: field_type_id
  validates :is_set, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :uuid, presence: true
end
