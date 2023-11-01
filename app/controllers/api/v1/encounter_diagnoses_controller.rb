class Api::V1::EncounterDiagnosesController < ApplicationController
  before_action :set_encounter_diagnosis, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @encounter_diagnoses = EncounterDiagnosis.all
    respond_with(@encounter_diagnoses)
  end

  def show
    respond_with(@encounter_diagnosis)
  end

  def create
    @encounter_diagnosis = EncounterDiagnosis.new(encounter_diagnosis_params)
    @encounter_diagnosis.save
    respond_with(@encounter_diagnosis)
  end

  def update
    @encounter_diagnosis.update(encounter_diagnosis_params)
    respond_with(@encounter_diagnosis)
  end

  def destroy
    @encounter_diagnosis.destroy
    respond_with(@encounter_diagnosis)
  end

  private
    def set_encounter_diagnosis
      @encounter_diagnosis = EncounterDiagnosis.find(params[:id])
    end

    def encounter_diagnosis_params
      params.require(:encounter_diagnosis).permit(:diagnosis_coded, :diagnosis_non_coded, :diagnosis_coded_name, :encounter_id, :patient_id, :condition_id, :certainty, :rank, :uuid, :creator, :date_created, :changed_by, :date_changed, :voided, :voided_by, :date_voided, :void_reason)
    end
end
