# frozen_string_literal: true

# Model: ConceptSetDerived
class ConceptSetDerived < ApplicationRecord
  self.table_name = 'concept_set_derived'
  self.primary_key = '["concept_id", "concept_set"]'

  validates :concept_id, presence: true
  validates :concept_set, presence: true
end
