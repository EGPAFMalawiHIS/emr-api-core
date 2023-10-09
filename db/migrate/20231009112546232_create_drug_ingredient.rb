# frozen_string_literal: true

# Migration responsible for creating the drug_ingredient table
class CreateDrugIngredient < ActiveRecord::Migration[6.0]
  def change
    create_table :drug_ingredient, id: false do |t|
      t.bigint :drug_id, null: false, limit: 4
      t.bigint :ingredient_id, null: false, limit: 4
      t.string :uuid, null: false, limit: 38
      t.float :strength, limit: 53
      t.bigint :units, limit: 4
    end
  end
end
