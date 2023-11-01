class Api::V1::LocationAttributesController < ApplicationController
  before_action :set_location_attribute, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @location_attributes = LocationAttribute.all
    respond_with(@location_attributes)
  end

  def show
    respond_with(@location_attribute)
  end

  def create
    @location_attribute = LocationAttribute.new(location_attribute_params)
    @location_attribute.save
    respond_with(@location_attribute)
  end

  def update
    @location_attribute.update(location_attribute_params)
    respond_with(@location_attribute)
  end

  def destroy
    @location_attribute.destroy
    respond_with(@location_attribute)
  end

  private
    def set_location_attribute
      @location_attribute = LocationAttribute.find(params[:id])
    end

    def location_attribute_params
      params.require(:location_attribute).permit(:location_id, :attribute_type_id, :value_reference, :uuid, :creator, :date_created, :changed_by, :date_changed, :voided, :voided_by, :date_voided, :void_reason)
    end
end
