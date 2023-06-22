class Api::V1::ConceptProposalsController < ApplicationController
  before_action :set_concept_proposal, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_proposals = ConceptProposal.all
    respond_with(@concept_proposals)
  end

  def show
    respond_with(@concept_proposal)
  end

  def create
    @concept_proposal = ConceptProposal.new(concept_proposal_params)
    @concept_proposal.save
    respond_with(@concept_proposal)
  end

  def update
    @concept_proposal.update(concept_proposal_params)
    respond_with(@concept_proposal)
  end

  def destroy
    @concept_proposal.destroy
    respond_with(@concept_proposal)
  end

  private
    def set_concept_proposal
      @concept_proposal = ConceptProposal.find(params[:id])
    end

    def concept_proposal_params
      params.require(:concept_proposal).permit(:concept_id, :encounter_id, :original_text, :final_text, :obs_id, :obs_concept_id, :state, :comments, :creator, :date_created, :changed_by, :date_changed, :locale, :uuid)
    end
end
