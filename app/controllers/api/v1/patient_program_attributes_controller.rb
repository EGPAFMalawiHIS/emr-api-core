class Api::V1::PatientProgramAttributesController < ApplicationController
  before_action :set_patient_program_attribute, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @patient_program_attributes = PatientProgramAttribute.all
    respond_with(@patient_program_attributes)
  end

  def show
    respond_with(@patient_program_attribute)
  end

  def create
    @patient_program_attribute = PatientProgramAttribute.new(patient_program_attribute_params)
    @patient_program_attribute.save
    respond_with(@patient_program_attribute)
  end

  def update
    @patient_program_attribute.update(patient_program_attribute_params)
    respond_with(@patient_program_attribute)
  end

  def destroy
    @patient_program_attribute.destroy
    respond_with(@patient_program_attribute)
  end

  private
    def set_patient_program_attribute
      @patient_program_attribute = PatientProgramAttribute.find(params[:id])
    end

    def patient_program_attribute_params
      params.require(:patient_program_attribute).permit(:patient_program_id, :attribute_type_id, :value_reference, :uuid, :creator, :date_created, :changed_by, :date_changed, :voided, :voided_by, :date_voided, :void_reason)
    end
end
