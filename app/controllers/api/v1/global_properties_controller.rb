class Api::V1::GlobalPropertiesController < ApplicationController
  before_action :set_global_property, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @global_properties = GlobalProperty.all
    respond_with(@global_properties)
  end

  def show
    respond_with(@global_property)
  end

  def create
    @global_property = GlobalProperty.new(global_property_params)
    @global_property.save
    respond_with(@global_property)
  end

  def update
    @global_property.update(global_property_params)
    respond_with(@global_property)
  end

  def destroy
    @global_property.destroy
    respond_with(@global_property)
  end

  private
    def set_global_property
      @global_property = GlobalProperty.find(params[:id])
    end

    def global_property_params
      params.require(:global_property).permit(:property_value, :description, :uuid, :datatype, :datatype_config, :preferred_handler, :handler_config, :date_changed, :changed_by)
    end
end
