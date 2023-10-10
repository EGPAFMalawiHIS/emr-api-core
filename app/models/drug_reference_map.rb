# frozen_string_literal: true

# Model: DrugReferenceMap
class DrugReferenceMap < ApplicationRecord
  self.table_name = 'drug_reference_map'
  self.primary_key = 'drug_reference_map_id'

  validates :drug_id, presence: true
  validates :term_id, presence: true
  validates :concept_map_type, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
  validates :uuid, presence: true
end
