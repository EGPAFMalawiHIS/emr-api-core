# frozen_string_literal: true

# Model: DrugIngredient
class DrugIngredient < ApplicationRecord
  self.table_name = 'drug_ingredient'
  self.primary_key = '["drug_id", "ingredient_id"]'

  belongs_to :drug, foreign_key: :drug_id, primary_key: :drug_id, optional: true
  
  validates :drug_id, presence: true
  validates :ingredient_id, presence: true
  validates :uuid, presence: true
end
