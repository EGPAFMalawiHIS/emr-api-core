class Api::V1::EncountersController < ApplicationController
  before_action :set_encounter, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @encounters = Encounter.all
    respond_with(@encounters)
  end

  def show
    respond_with(@encounter)
  end

  def create
    @encounter = Encounter.new(encounter_params)
    @encounter.save
    respond_with(@encounter)
  end

  def update
    @encounter.update(encounter_params)
    respond_with(@encounter)
  end

  def destroy
    @encounter.destroy
    respond_with(@encounter)
  end

  private
    def set_encounter
      @encounter = Encounter.find(params[:id])
    end

    def encounter_params
      params.require(:encounter).permit(:encounter_type, :patient_id, :location_id, :form_id, :encounter_datetime, :creator, :date_created, :voided, :voided_by, :date_voided, :void_reason, :uuid, :changed_by, :date_changed, :visit_id)
    end
end
