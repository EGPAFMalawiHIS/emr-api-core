class Api::V1::ConceptReferenceMapsController < ApplicationController
  before_action :set_concept_reference_map, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_reference_maps = ConceptReferenceMap.all
    respond_with(@concept_reference_maps)
  end

  def show
    respond_with(@concept_reference_map)
  end

  def create
    @concept_reference_map = ConceptReferenceMap.new(concept_reference_map_params)
    @concept_reference_map.save
    respond_with(@concept_reference_map)
  end

  def update
    @concept_reference_map.update(concept_reference_map_params)
    respond_with(@concept_reference_map)
  end

  def destroy
    @concept_reference_map.destroy
    respond_with(@concept_reference_map)
  end

  private
    def set_concept_reference_map
      @concept_reference_map = ConceptReferenceMap.find(params[:id])
    end

    def concept_reference_map_params
      params.require(:concept_reference_map).permit(:creator, :date_created, :concept_id, :uuid, :concept_reference_term_id, :concept_map_type_id, :changed_by, :date_changed)
    end
end
