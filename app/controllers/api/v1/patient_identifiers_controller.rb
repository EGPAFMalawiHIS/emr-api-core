class Api::V1::PatientIdentifiersController < ApplicationController
  before_action :set_patient_identifier, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @patient_identifiers = PatientIdentifier.all
    respond_with(@patient_identifiers)
  end

  def show
    respond_with(@patient_identifier)
  end

  def create
    @patient_identifier = PatientIdentifier.new(patient_identifier_params)
    @patient_identifier.save
    respond_with(@patient_identifier)
  end

  def update
    @patient_identifier.update(patient_identifier_params)
    respond_with(@patient_identifier)
  end

  def destroy
    @patient_identifier.destroy
    respond_with(@patient_identifier)
  end

  private
    def set_patient_identifier
      @patient_identifier = PatientIdentifier.find(params[:id])
    end

    def patient_identifier_params
      params.require(:patient_identifier).permit(:patient_id, :identifier, :identifier_type, :preferred, :location_id, :creator, :date_created, :voided, :voided_by, :date_voided, :void_reason, :uuid, :date_changed, :changed_by)
    end
end
