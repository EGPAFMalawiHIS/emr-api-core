class AllergyReaction < ApplicationRecord
  belongs_to :allergy
  belongs_to :reaction_concept
end
