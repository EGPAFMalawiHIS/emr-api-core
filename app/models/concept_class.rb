# frozen_string_literal: true

# Model: ConceptClass
class ConceptClass < ApplicationRecord
  self.table_name = 'concept_class'
  self.primary_key = 'concept_class_id'

  has_many :concept, foreign_key: class_id, primary_key: concept_class_id
  has_many :order_type_class_map, foreign_key: concept_class_id, primary_key: concept_class_id
  validates :name, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
