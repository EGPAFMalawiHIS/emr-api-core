class Api::V1::ConceptDescriptionsController < ApplicationController
  before_action :set_concept_description, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_descriptions = ConceptDescription.all
    respond_with(@concept_descriptions)
  end

  def show
    respond_with(@concept_description)
  end

  def create
    @concept_description = ConceptDescription.new(concept_description_params)
    @concept_description.save
    respond_with(@concept_description)
  end

  def update
    @concept_description.update(concept_description_params)
    respond_with(@concept_description)
  end

  def destroy
    @concept_description.destroy
    respond_with(@concept_description)
  end

  private
    def set_concept_description
      @concept_description = ConceptDescription.find(params[:id])
    end

    def concept_description_params
      params.require(:concept_description).permit(:concept_id, :description, :locale, :creator, :date_created, :changed_by, :date_changed, :uuid)
    end
end
