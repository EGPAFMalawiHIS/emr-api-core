class Api::V1::ConceptReferenceTermMapsController < ApplicationController
  before_action :set_concept_reference_term_map, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_reference_term_maps = ConceptReferenceTermMap.all
    respond_with(@concept_reference_term_maps)
  end

  def show
    respond_with(@concept_reference_term_map)
  end

  def create
    @concept_reference_term_map = ConceptReferenceTermMap.new(concept_reference_term_map_params)
    @concept_reference_term_map.save
    respond_with(@concept_reference_term_map)
  end

  def update
    @concept_reference_term_map.update(concept_reference_term_map_params)
    respond_with(@concept_reference_term_map)
  end

  def destroy
    @concept_reference_term_map.destroy
    respond_with(@concept_reference_term_map)
  end

  private
    def set_concept_reference_term_map
      @concept_reference_term_map = ConceptReferenceTermMap.find(params[:id])
    end

    def concept_reference_term_map_params
      params.require(:concept_reference_term_map).permit(:term_a_id, :term_b_id, :a_is_to_b_id, :creator, :date_created, :changed_by, :date_changed, :uuid)
    end
end
