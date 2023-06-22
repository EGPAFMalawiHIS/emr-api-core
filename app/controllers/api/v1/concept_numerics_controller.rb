class Api::V1::ConceptNumericsController < ApplicationController
  before_action :set_concept_numeric, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_numerics = ConceptNumeric.all
    respond_with(@concept_numerics)
  end

  def show
    respond_with(@concept_numeric)
  end

  def create
    @concept_numeric = ConceptNumeric.new(concept_numeric_params)
    @concept_numeric.save
    respond_with(@concept_numeric)
  end

  def update
    @concept_numeric.update(concept_numeric_params)
    respond_with(@concept_numeric)
  end

  def destroy
    @concept_numeric.destroy
    respond_with(@concept_numeric)
  end

  private
    def set_concept_numeric
      @concept_numeric = ConceptNumeric.find(params[:id])
    end

    def concept_numeric_params
      params.require(:concept_numeric).permit(:hi_absolute, :hi_critical, :hi_normal, :low_absolute, :low_critical, :low_normal, :units, :allow_decimal, :display_precision)
    end
end
