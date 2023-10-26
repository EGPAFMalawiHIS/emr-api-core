# frozen_string_literal: true

# Model: PersonMergeLog
class PersonMergeLog < VoidableRecord
  self.table_name = 'person_merge_log'
  self.primary_key = 'person_merge_log_id'

  validates :winner_person_id, :loser_person_id,:creator,:date_created,:merged_data, presence: true
end
