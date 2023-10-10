# frozen_string_literal: true

# Model: ConceptAttributeType
class ConceptAttributeType < ApplicationRecord
  self.table_name = 'concept_attribute_type'
  self.primary_key = 'concept_attribute_type_id'

  has_many :concept_attribute, foreign_key: attribute_type_id, primary_key: concept_attribute_type_id
  validates :name, presence: true
  validates :min_occurs, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
