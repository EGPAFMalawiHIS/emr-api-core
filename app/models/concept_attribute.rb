# frozen_string_literal: true

# Model: ConceptAttribute
class ConceptAttribute < ApplicationRecord
  self.table_name = 'concept_attribute'
  self.primary_key = 'concept_attribute_id'

  validates :concept_id, presence: true
  validates :attribute_type_id, presence: true
  validates :value_reference, presence: true
  validates :uuid, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :voided, presence: true
end
