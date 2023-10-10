# frozen_string_literal: true

# Model: ConceptReferenceMap
class ConceptReferenceMap < ApplicationRecord
  self.table_name = 'concept_reference_map'
  self.primary_key = 'concept_map_id'

  validates :creator, presence: true
  validates :date_created, presence: true
  validates :concept_id, presence: true
  validates :uuid, presence: true
  validates :concept_reference_term_id, presence: true
  validates :concept_map_type_id, presence: true
end
