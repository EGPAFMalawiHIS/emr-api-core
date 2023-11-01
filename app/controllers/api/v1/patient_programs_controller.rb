class Api::V1::PatientProgramsController < ApplicationController
  before_action :set_patient_program, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @patient_programs = PatientProgram.all
    respond_with(@patient_programs)
  end

  def show
    respond_with(@patient_program)
  end

  def create
    @patient_program = PatientProgram.new(patient_program_params)
    @patient_program.save
    respond_with(@patient_program)
  end

  def update
    @patient_program.update(patient_program_params)
    respond_with(@patient_program)
  end

  def destroy
    @patient_program.destroy
    respond_with(@patient_program)
  end

  private
    def set_patient_program
      @patient_program = PatientProgram.find(params[:id])
    end

    def patient_program_params
      params.require(:patient_program).permit(:patient_id, :program_id, :date_enrolled, :date_completed, :creator, :date_created, :changed_by, :date_changed, :voided, :voided_by, :date_voided, :void_reason, :uuid, :location_id, :outcome_concept_id)
    end
end
