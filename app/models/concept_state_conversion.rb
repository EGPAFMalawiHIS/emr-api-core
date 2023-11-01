# frozen_string_literal: true

# Model: ConceptStateConversion
class ConceptStateConversion < ApplicationRecord
  self.table_name = 'concept_state_conversion'
  self.primary_key = 'concept_state_conversion_id'

  belongs_to :concept, foreign_key: :concept_id, primary_key: :concept_id, optional: true

  validates :uuid, presence: true
end
