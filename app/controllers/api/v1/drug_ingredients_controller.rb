class Api::V1::DrugIngredientsController < ApplicationController
  before_action :set_drug_ingredient, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @drug_ingredients = DrugIngredient.all
    respond_with(@drug_ingredients)
  end

  def show
    respond_with(@drug_ingredient)
  end

  def create
    @drug_ingredient = DrugIngredient.new(drug_ingredient_params)
    @drug_ingredient.save
    respond_with(@drug_ingredient)
  end

  def update
    @drug_ingredient.update(drug_ingredient_params)
    respond_with(@drug_ingredient)
  end

  def destroy
    @drug_ingredient.destroy
    respond_with(@drug_ingredient)
  end

  private
    def set_drug_ingredient
      @drug_ingredient = DrugIngredient.find(params[:id])
    end

    def drug_ingredient_params
      params.require(:drug_ingredient).permit(:drug_id, :ingredient_id, :uuid, :strength, :units)
    end
end
