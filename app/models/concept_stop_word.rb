# frozen_string_literal: true

# Model: ConceptStopWord
class ConceptStopWord < ApplicationRecord
  self.table_name = 'concept_stop_word'
  self.primary_key = 'concept_stop_word_id'

  validates :word, presence: true
  validates :uuid, presence: true
end
