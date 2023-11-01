class Api::V1::AllergyReactionsController < ApplicationController
  before_action :set_allergy_reaction, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @allergy_reactions = AllergyReaction.all
    respond_with(@allergy_reactions)
  end

  def show
    respond_with(@allergy_reaction)
  end

  def create
    @allergy_reaction = AllergyReaction.new(allergy_reaction_params)
    @allergy_reaction.save
    respond_with(@allergy_reaction)
  end

  def update
    @allergy_reaction.update(allergy_reaction_params)
    respond_with(@allergy_reaction)
  end

  def destroy
    @allergy_reaction.destroy
    respond_with(@allergy_reaction)
  end

  private
    def set_allergy_reaction
      @allergy_reaction = AllergyReaction.find(params[:id])
    end

    def allergy_reaction_params
      params.require(:allergy_reaction).permit(:allergy_id, :reaction_concept_id, :reaction_non_coded, :uuid)
    end
end
