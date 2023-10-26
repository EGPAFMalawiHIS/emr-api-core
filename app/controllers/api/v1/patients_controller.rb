class Api::V1::PatientsController < ApplicationController
  respond_to :json
  include ParamConstants

  def index
    patients = PatientService.find_patients(ParamConstants::PATIENT_SEARCH_PARAMS)
    respond_with(patients)
  end

  def show
    respond_with(Patient.find_by_uuid(params[:id]))
  end

  def create
    create_params = params.permit ParamConstants::PATIENT_WHITELISTED_PARAMS

    patient = PatientService.create_patient(create_params)
    render json: patient, status: :created
  end

  def update
    patient = Patient.find_by_uuid(params[:id])
    edit_params = params.permit ParamConstants::PATIENT_WHITELISTED_PARAMS

    render json: PatientService.update_patient(patient, edit_params), status: :ok
  end

  def destroy
    patient = Patient.find_by_uuid(params[:id])
    patient.void(ParamConstants::PATIENT_WHITELISTED_PARAMS)
    render json: patient, status: :ok
  end
end
