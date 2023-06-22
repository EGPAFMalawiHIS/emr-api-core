class Api::V1::SerializedObjectsController < ApplicationController
  before_action :set_serialized_object, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @serialized_objects = SerializedObject.all
    respond_with(@serialized_objects)
  end

  def show
    respond_with(@serialized_object)
  end

  def create
    @serialized_object = SerializedObject.new(serialized_object_params)
    @serialized_object.save
    respond_with(@serialized_object)
  end

  def update
    @serialized_object.update(serialized_object_params)
    respond_with(@serialized_object)
  end

  def destroy
    @serialized_object.destroy
    respond_with(@serialized_object)
  end

  private
    def set_serialized_object
      @serialized_object = SerializedObject.find(params[:id])
    end

    def serialized_object_params
      params.require(:serialized_object).permit(:name, :description, :type, :subtype, :serialization_class, :serialized_data, :date_created, :creator, :date_changed, :changed_by, :retired, :date_retired, :retired_by, :retire_reason, :uuid)
    end
end
