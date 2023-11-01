# frozen_string_literal: true

# Model: ConceptStopWord
class ConceptStopWord < ApplicationRecord
  self.table_name = 'concept_stop_word'
  self.primary_key = 'concept_stop_word_id'

  belongs_to :concept_word, foreign_key: :concept_word_id, primary_key: :concept_word_id, optional: true

  validates :word, presence: true
  validates :uuid, presence: true
end
