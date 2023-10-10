# frozen_string_literal: true

# Model: AllergyReaction
class AllergyReaction < ApplicationRecord
  self.table_name = 'allergy_reaction'
  self.primary_key = 'allergy_reaction_id'

  belongs_to :allergy, foreign_key: :allergy_id, primary_key: :allergy_id, optional: true
  belongs_to :reaction_concept, foreign_key: :reaction_concept_id, primary_key: :concept_id, optional: true

  validates :allergy_id, presence: true
  validates :reaction_concept_id, presence: true
end
