class Api::V1::ProgramWorkflowStatesController < ApplicationController
  before_action :set_program_workflow_state, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @program_workflow_states = ProgramWorkflowState.all
    respond_with(@program_workflow_states)
  end

  def show
    respond_with(@program_workflow_state)
  end

  def create
    @program_workflow_state = ProgramWorkflowState.new(program_workflow_state_params)
    @program_workflow_state.save
    respond_with(@program_workflow_state)
  end

  def update
    @program_workflow_state.update(program_workflow_state_params)
    respond_with(@program_workflow_state)
  end

  def destroy
    @program_workflow_state.destroy
    respond_with(@program_workflow_state)
  end

  private
    def set_program_workflow_state
      @program_workflow_state = ProgramWorkflowState.find(params[:id])
    end

    def program_workflow_state_params
      params.require(:program_workflow_state).permit(:program_workflow_id, :concept_id, :initial, :terminal, :creator, :date_created, :retired, :changed_by, :date_changed, :uuid)
    end
end
