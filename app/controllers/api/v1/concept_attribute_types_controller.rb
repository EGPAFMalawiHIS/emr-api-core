class Api::V1::ConceptAttributeTypesController < ApplicationController
  before_action :set_concept_attribute_type, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_attribute_types = ConceptAttributeType.all
    respond_with(@concept_attribute_types)
  end

  def show
    respond_with(@concept_attribute_type)
  end

  def create
    @concept_attribute_type = ConceptAttributeType.new(concept_attribute_type_params)
    @concept_attribute_type.save
    respond_with(@concept_attribute_type)
  end

  def update
    @concept_attribute_type.update(concept_attribute_type_params)
    respond_with(@concept_attribute_type)
  end

  def destroy
    @concept_attribute_type.destroy
    respond_with(@concept_attribute_type)
  end

  private
    def set_concept_attribute_type
      @concept_attribute_type = ConceptAttributeType.find(params[:id])
    end

    def concept_attribute_type_params
      params.require(:concept_attribute_type).permit(:name, :description, :datatype, :datatype_config, :preferred_handler, :handler_config, :min_occurs, :max_occurs, :creator, :date_created, :changed_by, :date_changed, :retired, :retired_by, :date_retired, :retire_reason, :uuid)
    end
end
