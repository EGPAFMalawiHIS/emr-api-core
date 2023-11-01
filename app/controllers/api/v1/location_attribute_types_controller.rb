class Api::V1::LocationAttributeTypesController < ApplicationController
  before_action :set_location_attribute_type, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @location_attribute_types = LocationAttributeType.all
    respond_with(@location_attribute_types)
  end

  def show
    respond_with(@location_attribute_type)
  end

  def create
    @location_attribute_type = LocationAttributeType.new(location_attribute_type_params)
    @location_attribute_type.save
    respond_with(@location_attribute_type)
  end

  def update
    @location_attribute_type.update(location_attribute_type_params)
    respond_with(@location_attribute_type)
  end

  def destroy
    @location_attribute_type.destroy
    respond_with(@location_attribute_type)
  end

  private
    def set_location_attribute_type
      @location_attribute_type = LocationAttributeType.find(params[:id])
    end

    def location_attribute_type_params
      params.require(:location_attribute_type).permit(:name, :description, :datatype, :datatype_config, :preferred_handler, :handler_config, :min_occurs, :max_occurs, :creator, :date_created, :changed_by, :date_changed, :retired, :retired_by, :date_retired, :retire_reason, :uuid)
    end
end
