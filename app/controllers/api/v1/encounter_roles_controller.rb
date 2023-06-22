class Api::V1::EncounterRolesController < ApplicationController
  before_action :set_encounter_role, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @encounter_roles = EncounterRole.all
    respond_with(@encounter_roles)
  end

  def show
    respond_with(@encounter_role)
  end

  def create
    @encounter_role = EncounterRole.new(encounter_role_params)
    @encounter_role.save
    respond_with(@encounter_role)
  end

  def update
    @encounter_role.update(encounter_role_params)
    respond_with(@encounter_role)
  end

  def destroy
    @encounter_role.destroy
    respond_with(@encounter_role)
  end

  private
    def set_encounter_role
      @encounter_role = EncounterRole.find(params[:id])
    end

    def encounter_role_params
      params.require(:encounter_role).permit(:name, :description, :creator, :date_created, :changed_by, :date_changed, :retired, :retired_by, :date_retired, :retire_reason, :uuid)
    end
end
