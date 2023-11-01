# frozen_string_literal: true

# Model: Hl7InArchive
class Hl7InArchive < ApplicationRecord
  self.table_name = 'hl7_in_archive'
  self.primary_key = 'hl7_in_archive_id'

  validates :hl7_source, presence: true
  validates :hl7_data, presence: true
  validates :date_created, presence: true
  validates :uuid, presence: true
end
