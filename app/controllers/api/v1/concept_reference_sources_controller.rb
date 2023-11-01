class Api::V1::ConceptReferenceSourcesController < ApplicationController
  before_action :set_concept_reference_source, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_reference_sources = ConceptReferenceSource.all
    respond_with(@concept_reference_sources)
  end

  def show
    respond_with(@concept_reference_source)
  end

  def create
    @concept_reference_source = ConceptReferenceSource.new(concept_reference_source_params)
    @concept_reference_source.save
    respond_with(@concept_reference_source)
  end

  def update
    @concept_reference_source.update(concept_reference_source_params)
    respond_with(@concept_reference_source)
  end

  def destroy
    @concept_reference_source.destroy
    respond_with(@concept_reference_source)
  end

  private
    def set_concept_reference_source
      @concept_reference_source = ConceptReferenceSource.find(params[:id])
    end

    def concept_reference_source_params
      params.require(:concept_reference_source).permit(:name, :description, :hl7_code, :creator, :date_created, :retired, :retired_by, :date_retired, :retire_reason, :uuid, :unique_id, :date_changed, :changed_by)
    end
end
