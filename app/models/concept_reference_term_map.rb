# frozen_string_literal: true

# Model: ConceptReferenceTermMap
class ConceptReferenceTermMap < ApplicationRecord
  self.table_name = 'concept_reference_term_map'
  self.primary_key = 'concept_reference_term_map_id'

  validates :term_a_id, presence: true
  validates :term_b_id, presence: true
  validates :a_is_to_b_id, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :uuid, presence: true
end
