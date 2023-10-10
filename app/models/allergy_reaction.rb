# frozen_string_literal: true

# Model: AllergyReaction
class AllergyReaction < ApplicationRecord
  self.table_name = 'allergy_reaction'
  self.primary_key = 'allergy_reaction_id'

  validates :allergy_id, presence: true
  validates :reaction_concept_id, presence: true
end
