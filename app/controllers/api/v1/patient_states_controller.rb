class Api::V1::PatientStatesController < ApplicationController
  before_action :set_patient_state, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @patient_states = PatientState.all
    respond_with(@patient_states)
  end

  def show
    respond_with(@patient_state)
  end

  def create
    @patient_state = PatientState.new(patient_state_params)
    @patient_state.save
    respond_with(@patient_state)
  end

  def update
    @patient_state.update(patient_state_params)
    respond_with(@patient_state)
  end

  def destroy
    @patient_state.destroy
    respond_with(@patient_state)
  end

  private
    def set_patient_state
      @patient_state = PatientState.find(params[:id])
    end

    def patient_state_params
      params.require(:patient_state).permit(:patient_program_id, :state, :start_date, :end_date, :creator, :date_created, :changed_by, :date_changed, :voided, :voided_by, :date_voided, :void_reason, :uuid)
    end
end
