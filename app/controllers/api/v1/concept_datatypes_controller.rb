class Api::V1::ConceptDatatypesController < ApplicationController
  before_action :set_concept_datatype, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_datatypes = ConceptDatatype.all
    respond_with(@concept_datatypes)
  end

  def show
    respond_with(@concept_datatype)
  end

  def create
    @concept_datatype = ConceptDatatype.new(concept_datatype_params)
    @concept_datatype.save
    respond_with(@concept_datatype)
  end

  def update
    @concept_datatype.update(concept_datatype_params)
    respond_with(@concept_datatype)
  end

  def destroy
    @concept_datatype.destroy
    respond_with(@concept_datatype)
  end

  private
    def set_concept_datatype
      @concept_datatype = ConceptDatatype.find(params[:id])
    end

    def concept_datatype_params
      params.require(:concept_datatype).permit(:name, :hl7_abbreviation, :description, :creator, :date_created, :retired, :retired_by, :date_retired, :retire_reason, :uuid)
    end
end
