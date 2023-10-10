# frozen_string_literal: true

# Model: ConceptDatatype
class ConceptDatatype < ApplicationRecord
  self.table_name = 'concept_datatype'
  self.primary_key = 'concept_datatype_id'

  has_many :concept, foreign_key: datatype_id, primary_key: concept_datatype_id
  validates :name, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
