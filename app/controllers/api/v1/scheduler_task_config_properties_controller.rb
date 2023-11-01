class Api::V1::SchedulerTaskConfigPropertiesController < ApplicationController
  before_action :set_scheduler_task_config_property, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @scheduler_task_config_properties = SchedulerTaskConfigProperty.all
    respond_with(@scheduler_task_config_properties)
  end

  def show
    respond_with(@scheduler_task_config_property)
  end

  def create
    @scheduler_task_config_property = SchedulerTaskConfigProperty.new(scheduler_task_config_property_params)
    @scheduler_task_config_property.save
    respond_with(@scheduler_task_config_property)
  end

  def update
    @scheduler_task_config_property.update(scheduler_task_config_property_params)
    respond_with(@scheduler_task_config_property)
  end

  def destroy
    @scheduler_task_config_property.destroy
    respond_with(@scheduler_task_config_property)
  end

  private
    def set_scheduler_task_config_property
      @scheduler_task_config_property = SchedulerTaskConfigProperty.find(params[:id])
    end

    def scheduler_task_config_property_params
      params.require(:scheduler_task_config_property).permit(:name, :value, :task_config_id)
    end
end
