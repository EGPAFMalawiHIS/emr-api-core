# frozen_string_literal: true

# Model: ConceptNameTag
class ConceptNameTag < ApplicationRecord
  self.table_name = 'concept_name_tag'
  self.primary_key = 'concept_name_tag_id'

  has_many :concept_name_tag_map, foreign_key: concept_name_tag_id, primary_key: concept_name_tag_id
  has_many :concept_proposal_tag_map, foreign_key: concept_name_tag_id, primary_key: concept_name_tag_id
  validates :tag, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
  validates :uuid, presence: true
end
