# frozen_string_literal: true

# Model: ConceptReferenceMap
class ConceptReferenceMap < ApplicationRecord
  self.table_name = 'concept_reference_map'
  self.primary_key = 'concept_map_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :concept, foreign_key: :concept_id, primary_key: :concept_id, optional: true
  belongs_to :concept_reference_term, foreign_key: :concept_reference_term_id, primary_key: :concept_reference_term_id, optional: true
  belongs_to :concept_map_type, foreign_key: :concept_map_type_id, primary_key: :concept_map_type_id, optional: true

  validates :creator, presence: true
  validates :date_created, presence: true
  validates :concept_id, presence: true
  validates :uuid, presence: true
  validates :concept_reference_term_id, presence: true
  validates :concept_map_type_id, presence: true
end
