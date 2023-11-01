class Api::V1::SchedulerTaskConfigsController < ApplicationController
  before_action :set_scheduler_task_config, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @scheduler_task_configs = SchedulerTaskConfig.all
    respond_with(@scheduler_task_configs)
  end

  def show
    respond_with(@scheduler_task_config)
  end

  def create
    @scheduler_task_config = SchedulerTaskConfig.new(scheduler_task_config_params)
    @scheduler_task_config.save
    respond_with(@scheduler_task_config)
  end

  def update
    @scheduler_task_config.update(scheduler_task_config_params)
    respond_with(@scheduler_task_config)
  end

  def destroy
    @scheduler_task_config.destroy
    respond_with(@scheduler_task_config)
  end

  private
    def set_scheduler_task_config
      @scheduler_task_config = SchedulerTaskConfig.find(params[:id])
    end

    def scheduler_task_config_params
      params.require(:scheduler_task_config).permit(:name, :description, :schedulable_class, :start_time, :start_time_pattern, :repeat_interval, :start_on_startup, :started, :created_by, :date_created, :changed_by, :date_changed, :uuid, :last_execution_time)
    end
end
