class Api::V1::FieldsController < ApplicationController
  before_action :set_field, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @fields = Field.all
    respond_with(@fields)
  end

  def show
    respond_with(@field)
  end

  def create
    @field = Field.new(field_params)
    @field.save
    respond_with(@field)
  end

  def update
    @field.update(field_params)
    respond_with(@field)
  end

  def destroy
    @field.destroy
    respond_with(@field)
  end

  private
    def set_field
      @field = Field.find(params[:id])
    end

    def field_params
      params.require(:field).permit(:name, :description, :field_type, :concept_id, :table_name, :attribute_name, :default_value, :select_multiple, :creator, :date_created, :changed_by, :date_changed, :retired, :retired_by, :date_retired, :retire_reason, :uuid)
    end
end
