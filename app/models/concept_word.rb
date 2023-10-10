# frozen_string_literal: true

# Model: ConceptWord
class ConceptWord < ApplicationRecord
  self.table_name = 'concept_word'
  self.primary_key = 'concept_word_id'

  validates :concept_id, presence: true
  validates :word, presence: true
  validates :locale, presence: true
  validates :concept_name_id, presence: true
end
