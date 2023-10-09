# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the drug_ingredient table
class AddPrimaryKeysAndIndexesToDrugIngredient < ActiveRecord::Migration[6.0]
  def up
    add_index :drug_ingredient, %i[drug_id ingredient_id], unique: true
  end

  def down
    remove_index :drug_ingredient, %i[drug_id ingredient_id]
  end
end
