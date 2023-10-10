# frozen_string_literal: true

# Model: FormentryArchive
class FormentryArchive < ApplicationRecord
  self.table_name = 'formentry_archive'
  self.primary_key = 'formentry_archive_id'

  validates :form_data, presence: true
  validates :date_created, presence: true
  validates :creator, presence: true
end
