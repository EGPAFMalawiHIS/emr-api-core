# frozen_string_literal: true

# Model: ConceptWord
class ConceptWord < ApplicationRecord
  self.table_name = 'concept_word'
  self.primary_key = 'concept_word_id'

  belongs_to :concept, foreign_key: :concept_id, primary_key: :concept_id, optional: true
  belongs_to :concept_name, foreign_key: :concept_name_id, primary_key: :concept_name_id, optional: true

  validates :concept_id, presence: true
  validates :word, presence: true
  validates :locale, presence: true
  validates :concept_name_id, presence: true
end
