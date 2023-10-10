# frozen_string_literal: true

# Model: Hl7InError
class Hl7InError < ApplicationRecord
  self.table_name = 'hl7_in_error'
  self.primary_key = 'hl7_in_error_id'

  validates :hl7_source, presence: true
  validates :hl7_data, presence: true
  validates :error, presence: true
  validates :date_created, presence: true
  validates :uuid, presence: true
end
