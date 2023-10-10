# frozen_string_literal: true

# Model: ConceptMapType
class ConceptMapType < ApplicationRecord
  self.table_name = 'concept_map_type'
  self.primary_key = 'concept_map_type_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :forcer, class_name: 'User', foreign_key: :retired_by, primary_key: :user_id, optional: true
  has_many :concept_reference_map, foreign_key: concept_map_type_id, primary_key: concept_map_type_id
  has_many :concept_reference_term_map, foreign_key: a_is_to_b_id, primary_key: concept_map_type_id
  has_many :drug_reference_map, foreign_key: concept_map_type, primary_key: concept_map_type_id

  validates :name, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
