# frozen_string_literal: true

# Model: PersonMergeLog
class PersonMergeLog < ApplicationRecord
  self.table_name = 'person_merge_log'
  self.primary_key = 'person_merge_log_id'

  validates :winner_person_id, presence: true
  validates :loser_person_id, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :merged_data, presence: true
  validates :uuid, presence: true
  validates :voided, presence: true
end
