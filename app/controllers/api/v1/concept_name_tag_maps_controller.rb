class Api::V1::ConceptNameTagMapsController < ApplicationController
  before_action :set_concept_name_tag_map, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_name_tag_maps = ConceptNameTagMap.all
    respond_with(@concept_name_tag_maps)
  end

  def show
    respond_with(@concept_name_tag_map)
  end

  def create
    @concept_name_tag_map = ConceptNameTagMap.new(concept_name_tag_map_params)
    @concept_name_tag_map.save
    respond_with(@concept_name_tag_map)
  end

  def update
    @concept_name_tag_map.update(concept_name_tag_map_params)
    respond_with(@concept_name_tag_map)
  end

  def destroy
    @concept_name_tag_map.destroy
    respond_with(@concept_name_tag_map)
  end

  private
    def set_concept_name_tag_map
      @concept_name_tag_map = ConceptNameTagMap.find(params[:id])
    end

    def concept_name_tag_map_params
      params.require(:concept_name_tag_map).permit(:concept_name_id, :concept_name_tag_id)
    end
end
