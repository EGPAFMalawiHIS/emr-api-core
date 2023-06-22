class Api::V1::EncounterTypesController < ApplicationController
  before_action :set_encounter_type, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @encounter_types = EncounterType.all
    respond_with(@encounter_types)
  end

  def show
    respond_with(@encounter_type)
  end

  def create
    @encounter_type = EncounterType.new(encounter_type_params)
    @encounter_type.save
    respond_with(@encounter_type)
  end

  def update
    @encounter_type.update(encounter_type_params)
    respond_with(@encounter_type)
  end

  def destroy
    @encounter_type.destroy
    respond_with(@encounter_type)
  end

  private
    def set_encounter_type
      @encounter_type = EncounterType.find(params[:id])
    end

    def encounter_type_params
      params.require(:encounter_type).permit(:name, :description, :creator, :date_created, :retired, :retired_by, :date_retired, :retire_reason, :uuid, :view_privilege, :edit_privilege, :changed_by, :date_changed)
    end
end
