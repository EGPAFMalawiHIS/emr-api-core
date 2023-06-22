class Api::V1::ConceptStateConversionsController < ApplicationController
  before_action :set_concept_state_conversion, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_state_conversions = ConceptStateConversion.all
    respond_with(@concept_state_conversions)
  end

  def show
    respond_with(@concept_state_conversion)
  end

  def create
    @concept_state_conversion = ConceptStateConversion.new(concept_state_conversion_params)
    @concept_state_conversion.save
    respond_with(@concept_state_conversion)
  end

  def update
    @concept_state_conversion.update(concept_state_conversion_params)
    respond_with(@concept_state_conversion)
  end

  def destroy
    @concept_state_conversion.destroy
    respond_with(@concept_state_conversion)
  end

  private
    def set_concept_state_conversion
      @concept_state_conversion = ConceptStateConversion.find(params[:id])
    end

    def concept_state_conversion_params
      params.require(:concept_state_conversion).permit(:concept_id, :program_workflow_id, :program_workflow_state_id, :uuid)
    end
end
