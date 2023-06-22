class Api::V1::ConceptReferenceTermsController < ApplicationController
  before_action :set_concept_reference_term, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_reference_terms = ConceptReferenceTerm.all
    respond_with(@concept_reference_terms)
  end

  def show
    respond_with(@concept_reference_term)
  end

  def create
    @concept_reference_term = ConceptReferenceTerm.new(concept_reference_term_params)
    @concept_reference_term.save
    respond_with(@concept_reference_term)
  end

  def update
    @concept_reference_term.update(concept_reference_term_params)
    respond_with(@concept_reference_term)
  end

  def destroy
    @concept_reference_term.destroy
    respond_with(@concept_reference_term)
  end

  private
    def set_concept_reference_term
      @concept_reference_term = ConceptReferenceTerm.find(params[:id])
    end

    def concept_reference_term_params
      params.require(:concept_reference_term).permit(:concept_source_id, :name, :code, :version, :description, :creator, :date_created, :date_changed, :changed_by, :retired, :retired_by, :date_retired, :retire_reason, :uuid)
    end
end
