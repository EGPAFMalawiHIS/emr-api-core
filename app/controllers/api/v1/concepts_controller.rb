class Api::V1::ConceptsController < ApplicationController
  before_action :set_concept, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concepts = Concept.all
    respond_with(@concepts)
  end

  def show
    respond_with(@concept)
  end

  def create
    @concept = Concept.new(concept_params)
    @concept.save
    respond_with(@concept)
  end

  def update
    @concept.update(concept_params)
    respond_with(@concept)
  end

  def destroy
    @concept.destroy
    respond_with(@concept)
  end

  private
    def set_concept
      @concept = Concept.find(params[:id])
    end

    def concept_params
      params.require(:concept).permit(:retired, :short_name, :description, :form_text, :datatype_id, :class_id, :is_set, :creator, :date_created, :version, :changed_by, :date_changed, :retired_by, :date_retired, :retire_reason, :uuid)
    end
end
