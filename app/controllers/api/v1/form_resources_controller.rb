class Api::V1::FormResourcesController < ApplicationController
  before_action :set_form_resource, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @form_resources = FormResource.all
    respond_with(@form_resources)
  end

  def show
    respond_with(@form_resource)
  end

  def create
    @form_resource = FormResource.new(form_resource_params)
    @form_resource.save
    respond_with(@form_resource)
  end

  def update
    @form_resource.update(form_resource_params)
    respond_with(@form_resource)
  end

  def destroy
    @form_resource.destroy
    respond_with(@form_resource)
  end

  private
    def set_form_resource
      @form_resource = FormResource.find(params[:id])
    end

    def form_resource_params
      params.require(:form_resource).permit(:form_id, :name, :value_reference, :datatype, :datatype_config, :preferred_handler, :handler_config, :uuid, :date_changed, :changed_by)
    end
end
