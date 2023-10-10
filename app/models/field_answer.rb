# frozen_string_literal: true

# Model: FieldAnswer
class FieldAnswer < ApplicationRecord
  self.table_name = 'field_answer'
  self.primary_key = '["field_id", "answer_id"]'

  validates :field_id, presence: true
  validates :answer_id, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :uuid, presence: true
end
