class Api::V1::ProviderAttributesController < ApplicationController
  before_action :set_provider_attribute, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @provider_attributes = ProviderAttribute.all
    respond_with(@provider_attributes)
  end

  def show
    respond_with(@provider_attribute)
  end

  def create
    @provider_attribute = ProviderAttribute.new(provider_attribute_params)
    @provider_attribute.save
    respond_with(@provider_attribute)
  end

  def update
    @provider_attribute.update(provider_attribute_params)
    respond_with(@provider_attribute)
  end

  def destroy
    @provider_attribute.destroy
    respond_with(@provider_attribute)
  end

  private
    def set_provider_attribute
      @provider_attribute = ProviderAttribute.find(params[:id])
    end

    def provider_attribute_params
      params.require(:provider_attribute).permit(:provider_id, :attribute_type_id, :value_reference, :uuid, :creator, :date_created, :changed_by, :date_changed, :voided, :voided_by, :date_voided, :void_reason)
    end
end
