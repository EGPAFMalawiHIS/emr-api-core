class Api::V1::ConceptMapTypesController < ApplicationController
  before_action :set_concept_map_type, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_map_types = ConceptMapType.all
    respond_with(@concept_map_types)
  end

  def show
    respond_with(@concept_map_type)
  end

  def create
    @concept_map_type = ConceptMapType.new(concept_map_type_params)
    @concept_map_type.save
    respond_with(@concept_map_type)
  end

  def update
    @concept_map_type.update(concept_map_type_params)
    respond_with(@concept_map_type)
  end

  def destroy
    @concept_map_type.destroy
    respond_with(@concept_map_type)
  end

  private
    def set_concept_map_type
      @concept_map_type = ConceptMapType.find(params[:id])
    end

    def concept_map_type_params
      params.require(:concept_map_type).permit(:name, :description, :creator, :date_created, :changed_by, :date_changed, :is_hidden, :retired, :retired_by, :date_retired, :retire_reason, :uuid)
    end
end
