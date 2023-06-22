class Api::V1::PatientsController < ApplicationController
  before_action :set_patient, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @patients = Patient.all
    respond_with(@patients)
  end

  def show
    respond_with(@patient)
  end

  def create
    @patient = Patient.new(patient_params)
    @patient.save
    respond_with(@patient)
  end

  def update
    @patient.update(patient_params)
    respond_with(@patient)
  end

  def destroy
    @patient.destroy
    respond_with(@patient)
  end

  private
    def set_patient
      @patient = Patient.find(params[:id])
    end

    def patient_params
      params.require(:patient).permit(:creator, :date_created, :changed_by, :date_changed, :voided, :voided_by, :date_voided, :void_reason, :allergy_status)
    end
end
