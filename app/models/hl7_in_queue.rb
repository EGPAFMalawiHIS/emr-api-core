# frozen_string_literal: true

# Model: Hl7InQueue
class Hl7InQueue < ApplicationRecord
  self.table_name = 'hl7_in_queue'
  self.primary_key = 'hl7_in_queue_id'

  validates :hl7_source, presence: true
  validates :hl7_data, presence: true
  validates :message_state, presence: true
  validates :uuid, presence: true
end
