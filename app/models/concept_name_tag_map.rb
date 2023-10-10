# frozen_string_literal: true

# Model: ConceptNameTagMap
class ConceptNameTagMap < ApplicationRecord
  self.table_name = 'concept_name_tag_map'
  validates :concept_name_id, presence: true
  validates :concept_name_tag_id, presence: true
end
