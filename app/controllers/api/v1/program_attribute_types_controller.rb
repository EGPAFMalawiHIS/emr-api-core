class Api::V1::ProgramAttributeTypesController < ApplicationController
  before_action :set_program_attribute_type, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @program_attribute_types = ProgramAttributeType.all
    respond_with(@program_attribute_types)
  end

  def show
    respond_with(@program_attribute_type)
  end

  def create
    @program_attribute_type = ProgramAttributeType.new(program_attribute_type_params)
    @program_attribute_type.save
    respond_with(@program_attribute_type)
  end

  def update
    @program_attribute_type.update(program_attribute_type_params)
    respond_with(@program_attribute_type)
  end

  def destroy
    @program_attribute_type.destroy
    respond_with(@program_attribute_type)
  end

  private
    def set_program_attribute_type
      @program_attribute_type = ProgramAttributeType.find(params[:id])
    end

    def program_attribute_type_params
      params.require(:program_attribute_type).permit(:name, :description, :datatype, :datatype_config, :preferred_handler, :handler_config, :min_occurs, :max_occurs, :creator, :date_created, :changed_by, :date_changed, :retired, :retired_by, :date_retired, :retire_reason, :uuid)
    end
end
