class Api::V1::PersonAttributesController < ApplicationController
  before_action :set_person_attribute, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @person_attributes = PersonAttribute.all
    respond_with(@person_attributes)
  end

  def show
    respond_with(@person_attribute)
  end

  def create
    @person_attribute = PersonAttribute.new(person_attribute_params)
    @person_attribute.save
    respond_with(@person_attribute)
  end

  def update
    @person_attribute.update(person_attribute_params)
    respond_with(@person_attribute)
  end

  def destroy
    @person_attribute.destroy
    respond_with(@person_attribute)
  end

  private
    def set_person_attribute
      @person_attribute = PersonAttribute.find(params[:id])
    end

    def person_attribute_params
      params.require(:person_attribute).permit(:person_id, :value, :person_attribute_type_id, :creator, :date_created, :changed_by, :date_changed, :voided, :voided_by, :date_voided, :void_reason, :uuid)
    end
end
