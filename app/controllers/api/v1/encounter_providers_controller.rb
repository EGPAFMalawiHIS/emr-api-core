class Api::V1::EncounterProvidersController < ApplicationController
  before_action :set_encounter_provider, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @encounter_providers = EncounterProvider.all
    respond_with(@encounter_providers)
  end

  def show
    respond_with(@encounter_provider)
  end

  def create
    @encounter_provider = EncounterProvider.new(encounter_provider_params)
    @encounter_provider.save
    respond_with(@encounter_provider)
  end

  def update
    @encounter_provider.update(encounter_provider_params)
    respond_with(@encounter_provider)
  end

  def destroy
    @encounter_provider.destroy
    respond_with(@encounter_provider)
  end

  private
    def set_encounter_provider
      @encounter_provider = EncounterProvider.find(params[:id])
    end

    def encounter_provider_params
      params.require(:encounter_provider).permit(:encounter_id, :provider_id, :encounter_role_id, :creator, :date_created, :changed_by, :date_changed, :voided, :date_voided, :voided_by, :void_reason, :uuid)
    end
end
