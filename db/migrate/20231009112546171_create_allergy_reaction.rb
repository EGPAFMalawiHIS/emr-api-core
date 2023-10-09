# frozen_string_literal: true

# Migration responsible for creating the allergy_reaction table
class CreateAllergyReaction < ActiveRecord::Migration[6.0]
  def change
    create_table :allergy_reaction, id: false do |t|
      t.bigint :allergy_reaction_id, null: false, limit: 4
      t.bigint :allergy_id, null: false, limit: 4
      t.bigint :reaction_concept_id, null: false, limit: 4
      t.string :reaction_non_coded, limit: 255
      t.string :uuid, limit: 38
    end
  end
end
