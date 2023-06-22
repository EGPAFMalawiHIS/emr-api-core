class DrugIngredient < ApplicationRecord
  belongs_to :drug
  belongs_to :ingredient
end
