# frozen_string_literal: true

# Migration responsible for adding foreign keys to the drug_ingredient table
class AddForeignKeysToDrugIngredient < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :drug_ingredient, :drug, column: :drug_id, primary_key: :drug_id
    add_foreign_key :drug_ingredient, :concept, column: :ingredient_id, primary_key: :concept_id
    add_foreign_key :drug_ingredient, :concept, column: :units, primary_key: :concept_id
  end
end
