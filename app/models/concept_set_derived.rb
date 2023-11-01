# frozen_string_literal: true

# Model: ConceptSetDerived
class ConceptSetDerived < ApplicationRecord
  self.table_name = 'concept_set_derived'
  self.primary_key = '["concept_id", "concept_set"]'

  belongs_to :concept, foreign_key: :concept_id, primary_key: :concept_id, optional: true
  belongs_to :set, class_name: 'Concept', foreign_key: :concept_set, primary_key: :concept_id, optional: true

  validates :concept_id, presence: true
  validates :concept_set, presence: true
end
