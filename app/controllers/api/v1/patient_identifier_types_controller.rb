class Api::V1::PatientIdentifierTypesController < ApplicationController
  before_action :set_patient_identifier_type, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @patient_identifier_types = PatientIdentifierType.all
    respond_with(@patient_identifier_types)
  end

  def show
    respond_with(@patient_identifier_type)
  end

  def create
    @patient_identifier_type = PatientIdentifierType.new(patient_identifier_type_params)
    @patient_identifier_type.save
    respond_with(@patient_identifier_type)
  end

  def update
    @patient_identifier_type.update(patient_identifier_type_params)
    respond_with(@patient_identifier_type)
  end

  def destroy
    @patient_identifier_type.destroy
    respond_with(@patient_identifier_type)
  end

  private
    def set_patient_identifier_type
      @patient_identifier_type = PatientIdentifierType.find(params[:id])
    end

    def patient_identifier_type_params
      params.require(:patient_identifier_type).permit(:name, :description, :format, :check_digit, :creator, :date_created, :required, :format_description, :validator, :retired, :retired_by, :date_retired, :retire_reason, :uuid, :location_behavior, :uniqueness_behavior, :date_changed, :changed_by)
    end
end
