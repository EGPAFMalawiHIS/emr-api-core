# frozen_string_literal: true

# Model: FormentryQueue
class FormentryQueue < ApplicationRecord
  self.table_name = 'formentry_queue'
  self.primary_key = 'formentry_queue_id'

  validates :form_data, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
end
