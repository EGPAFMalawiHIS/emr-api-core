class Api::V1::ProgramWorkflowsController < ApplicationController
  before_action :set_program_workflow, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @program_workflows = ProgramWorkflow.all
    respond_with(@program_workflows)
  end

  def show
    respond_with(@program_workflow)
  end

  def create
    @program_workflow = ProgramWorkflow.new(program_workflow_params)
    @program_workflow.save
    respond_with(@program_workflow)
  end

  def update
    @program_workflow.update(program_workflow_params)
    respond_with(@program_workflow)
  end

  def destroy
    @program_workflow.destroy
    respond_with(@program_workflow)
  end

  private
    def set_program_workflow
      @program_workflow = ProgramWorkflow.find(params[:id])
    end

    def program_workflow_params
      params.require(:program_workflow).permit(:program_id, :concept_id, :creator, :date_created, :retired, :changed_by, :date_changed, :uuid)
    end
end
