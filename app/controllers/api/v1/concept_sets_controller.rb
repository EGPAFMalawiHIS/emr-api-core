class Api::V1::ConceptSetsController < ApplicationController
  before_action :set_concept_set, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_sets = ConceptSet.all
    respond_with(@concept_sets)
  end

  def show
    respond_with(@concept_set)
  end

  def create
    @concept_set = ConceptSet.new(concept_set_params)
    @concept_set.save
    respond_with(@concept_set)
  end

  def update
    @concept_set.update(concept_set_params)
    respond_with(@concept_set)
  end

  def destroy
    @concept_set.destroy
    respond_with(@concept_set)
  end

  private
    def set_concept_set
      @concept_set = ConceptSet.find(params[:id])
    end

    def concept_set_params
      params.require(:concept_set).permit(:concept_id, :concept_set, :sort_weight, :creator, :date_created, :uuid)
    end
end
