# frozen_string_literal: true

# Model: FormentryError
class FormentryError < ApplicationRecord
  self.table_name = 'formentry_error'
  self.primary_key = 'formentry_error_id'

  validates :form_data, presence: true
  validates :error, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
end
