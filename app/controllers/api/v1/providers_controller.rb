class Api::V1::ProvidersController < ApplicationController
  before_action :set_provider, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @providers = Provider.all
    respond_with(@providers)
  end

  def show
    respond_with(@provider)
  end

  def create
    @provider = Provider.new(provider_params)
    @provider.save
    respond_with(@provider)
  end

  def update
    @provider.update(provider_params)
    respond_with(@provider)
  end

  def destroy
    @provider.destroy
    respond_with(@provider)
  end

  private
    def set_provider
      @provider = Provider.find(params[:id])
    end

    def provider_params
      params.require(:provider).permit(:person_id, :name, :identifier, :creator, :date_created, :changed_by, :date_changed, :retired, :retired_by, :date_retired, :retire_reason, :uuid, :role_id, :speciality_id)
    end
end
