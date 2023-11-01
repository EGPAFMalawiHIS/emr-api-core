# frozen_string_literal: true

# Model: ConceptNameTagMap
class ConceptNameTagMap < ApplicationRecord
  self.table_name = 'concept_name_tag_map'

  belongs_to :concept_name, foreign_key: :concept_name_id, primary_key: :concept_name_id, optional: true
  belongs_to :concept_name_tag, foreign_key: :concept_name_tag_id, primary_key: :concept_name_tag_id, optional: true
  
  # concept_name_id and concept_name_tag_id are unique together
  validates :concept_name_id, uniqueness: { scope: :concept_name_tag_id }
  validates :concept_name_id, presence: true
  validates :concept_name_tag_id, presence: true
end
