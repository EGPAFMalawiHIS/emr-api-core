# frozen_string_literal: true

# Migration responsible for adding foreign keys to the allergy_reaction table
class AddForeignKeysToAllergyReaction < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :allergy_reaction, :allergy, column: :allergy_id, primary_key: :allergy_id
    add_foreign_key :allergy_reaction, :concept, column: :reaction_concept_id, primary_key: :concept_id
  end
end
