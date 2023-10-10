# frozen_string_literal: true

# Model: ConceptSet
class ConceptSet < ApplicationRecord
  self.table_name = 'concept_set'
  self.primary_key = 'concept_set_id'

  validates :concept_id, presence: true
  validates :concept_set, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :uuid, presence: true
end
