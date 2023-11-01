class Api::V1::ConceptsController < ApplicationController
  respond_to :json

  def index
    render json: ConceptService.find_concepts(params), status: :ok
  end

  def show
    respond_with(Concept.find_by_uuid(params[:id]))
  end

  def create
    render json: ConceptService.create_concept(concept_params), status: :created
  end

  private
    def concept_params
      ParamConstants::CONCEPT_WHITELISTED_PARAMS
    end
end
