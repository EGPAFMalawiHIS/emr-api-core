class Api::V1::ConceptAttributesController < ApplicationController
  before_action :set_concept_attribute, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_attributes = ConceptAttribute.all
    respond_with(@concept_attributes)
  end

  def show
    respond_with(@concept_attribute)
  end

  def create
    @concept_attribute = ConceptAttribute.new(concept_attribute_params)
    @concept_attribute.save
    respond_with(@concept_attribute)
  end

  def update
    @concept_attribute.update(concept_attribute_params)
    respond_with(@concept_attribute)
  end

  def destroy
    @concept_attribute.destroy
    respond_with(@concept_attribute)
  end

  private
    def set_concept_attribute
      @concept_attribute = ConceptAttribute.find(params[:id])
    end

    def concept_attribute_params
      params.require(:concept_attribute).permit(:concept_id, :attribute_type_id, :value_reference, :uuid, :creator, :date_created, :changed_by, :date_changed, :voided, :voided_by, :date_voided, :void_reason)
    end
end
