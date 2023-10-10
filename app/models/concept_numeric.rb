# frozen_string_literal: true

# Model: ConceptNumeric
class ConceptNumeric < ApplicationRecord
  self.table_name = 'concept_numeric'
  self.primary_key = 'concept_id'

  belongs_to :concept, foreign_key: :concept_id, primary_key: :concept_id, optional: true
end
