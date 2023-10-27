class Api::V1::EncountersController < ApplicationController
  respond_to :json
  before_action :permit_params

  def index
    EncounterService.find_encounters(encounter_params) 
  end

  def show
    respond_with(Encounter.find_by_uuid(params[:id]))
  end

  def create
    encounter = EncounterService.create_encounter(encounter_params)
    render json: encounter, status: :created
  end

  def update
    encounter = EncounterService.update_encounter(Encounter.find_by_uuid(params[:id], encounter_params))
    render json: encounter, status: :ok
  end

  def destroy
    encounter = Encounter.find_by_uuid(params[:id])
    encounter.void(params[:void_reason])
  end

  private

    def encounter_params
      params.permit ParamConstants::ENCOUNTER_WHITELISTED_PARAMS
    end
  end