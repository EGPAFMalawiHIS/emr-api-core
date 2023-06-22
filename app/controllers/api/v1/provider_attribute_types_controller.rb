class Api::V1::ProviderAttributeTypesController < ApplicationController
  before_action :set_provider_attribute_type, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @provider_attribute_types = ProviderAttributeType.all
    respond_with(@provider_attribute_types)
  end

  def show
    respond_with(@provider_attribute_type)
  end

  def create
    @provider_attribute_type = ProviderAttributeType.new(provider_attribute_type_params)
    @provider_attribute_type.save
    respond_with(@provider_attribute_type)
  end

  def update
    @provider_attribute_type.update(provider_attribute_type_params)
    respond_with(@provider_attribute_type)
  end

  def destroy
    @provider_attribute_type.destroy
    respond_with(@provider_attribute_type)
  end

  private
    def set_provider_attribute_type
      @provider_attribute_type = ProviderAttributeType.find(params[:id])
    end

    def provider_attribute_type_params
      params.require(:provider_attribute_type).permit(:name, :description, :datatype, :datatype_config, :preferred_handler, :handler_config, :min_occurs, :max_occurs, :creator, :date_created, :changed_by, :date_changed, :retired, :retired_by, :date_retired, :retire_reason, :uuid)
    end
end
