class Api::V1::ConceptSetDerivedsController < ApplicationController
  before_action :set_concept_set_derived, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_set_deriveds = ConceptSetDerived.all
    respond_with(@concept_set_deriveds)
  end

  def show
    respond_with(@concept_set_derived)
  end

  def create
    @concept_set_derived = ConceptSetDerived.new(concept_set_derived_params)
    @concept_set_derived.save
    respond_with(@concept_set_derived)
  end

  def update
    @concept_set_derived.update(concept_set_derived_params)
    respond_with(@concept_set_derived)
  end

  def destroy
    @concept_set_derived.destroy
    respond_with(@concept_set_derived)
  end

  private
    def set_concept_set_derived
      @concept_set_derived = ConceptSetDerived.find(params[:id])
    end

    def concept_set_derived_params
      params.require(:concept_set_derived).permit(:concept_id, :concept_set, :sort_weight, :uuid)
    end
end
