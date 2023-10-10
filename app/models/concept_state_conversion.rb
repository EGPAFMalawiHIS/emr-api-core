# frozen_string_literal: true

# Model: ConceptStateConversion
class ConceptStateConversion < ApplicationRecord
  self.table_name = 'concept_state_conversion'
  self.primary_key = 'concept_state_conversion_id'

  validates :uuid, presence: true
end
