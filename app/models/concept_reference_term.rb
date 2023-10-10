# frozen_string_literal: true

# Model: ConceptReferenceTerm
class ConceptReferenceTerm < ApplicationRecord
  self.table_name = 'concept_reference_term'
  self.primary_key = 'concept_reference_term_id'

  has_many :concept_reference_map, foreign_key: concept_reference_term_id, primary_key: concept_reference_term_id
  has_many :concept_reference_term_map, foreign_key: term_a_id, primary_key: concept_reference_term_id
  has_many :concept_reference_term_map, foreign_key: term_b_id, primary_key: concept_reference_term_id
  has_many :drug_reference_map, foreign_key: term_id, primary_key: concept_reference_term_id
  validates :concept_source_id, presence: true
  validates :code, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
