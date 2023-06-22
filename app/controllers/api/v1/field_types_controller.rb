class Api::V1::FieldTypesController < ApplicationController
  before_action :set_field_type, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @field_types = FieldType.all
    respond_with(@field_types)
  end

  def show
    respond_with(@field_type)
  end

  def create
    @field_type = FieldType.new(field_type_params)
    @field_type.save
    respond_with(@field_type)
  end

  def update
    @field_type.update(field_type_params)
    respond_with(@field_type)
  end

  def destroy
    @field_type.destroy
    respond_with(@field_type)
  end

  private
    def set_field_type
      @field_type = FieldType.find(params[:id])
    end

    def field_type_params
      params.require(:field_type).permit(:name, :description, :is_set, :creator, :date_created, :uuid)
    end
end
