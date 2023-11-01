class Api::V1::ProgramsController < ApplicationController
  before_action :set_program, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @programs = Program.all
    respond_with(@programs)
  end

  def show
    respond_with(@program)
  end

  def create
    @program = Program.new(program_params)
    @program.save
    respond_with(@program)
  end

  def update
    @program.update(program_params)
    respond_with(@program)
  end

  def destroy
    @program.destroy
    respond_with(@program)
  end

  private
    def set_program
      @program = Program.find(params[:id])
    end

    def program_params
      params.require(:program).permit(:concept_id, :creator, :date_created, :changed_by, :date_changed, :retired, :name, :description, :uuid, :outcomes_concept_id)
    end
end
