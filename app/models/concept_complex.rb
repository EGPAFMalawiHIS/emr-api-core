# frozen_string_literal: true

# Model: ConceptComplex
class ConceptComplex < ApplicationRecord
  self.table_name = 'concept_complex'
  self.primary_key = 'concept_id'

  belongs_to :concept, foreign_key: :concept_id, primary_key: :concept_id, optional: true
end
