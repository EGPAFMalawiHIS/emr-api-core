class Api::V1::ConceptProposalTagMapsController < ApplicationController
  before_action :set_concept_proposal_tag_map, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_proposal_tag_maps = ConceptProposalTagMap.all
    respond_with(@concept_proposal_tag_maps)
  end

  def show
    respond_with(@concept_proposal_tag_map)
  end

  def create
    @concept_proposal_tag_map = ConceptProposalTagMap.new(concept_proposal_tag_map_params)
    @concept_proposal_tag_map.save
    respond_with(@concept_proposal_tag_map)
  end

  def update
    @concept_proposal_tag_map.update(concept_proposal_tag_map_params)
    respond_with(@concept_proposal_tag_map)
  end

  def destroy
    @concept_proposal_tag_map.destroy
    respond_with(@concept_proposal_tag_map)
  end

  private
    def set_concept_proposal_tag_map
      @concept_proposal_tag_map = ConceptProposalTagMap.find(params[:id])
    end

    def concept_proposal_tag_map_params
      params.require(:concept_proposal_tag_map).permit(:concept_proposal_id, :concept_name_tag_id)
    end
end
