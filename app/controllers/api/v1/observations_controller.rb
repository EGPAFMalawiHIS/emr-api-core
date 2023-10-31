class Api::V1::ObservationsController < ApplicationController

  def index
    render json: ObservationService.find_observations(obs_params), status: :ok
  end

  def show
    respond_with(Observation.find_by_uuid(params[:id]))
  end

  def create
    obs = ObservationService.create_observations(obs_params)
    render obs, status: :created
  end

  def update
    obs = Observation.find_by_uuid(params[:id])
    render ObservationService.update_observations(obs, obs_params), status: :ok
  end

  def destroy
    obs = Observation.find_by_uuid(params[:id])
    obs.void(obs_params[:void_reason])
  end

  private

    def obs_params
      params.permit ParamConstants::OBS_WHITELISTED_PARAMS
    end
end
