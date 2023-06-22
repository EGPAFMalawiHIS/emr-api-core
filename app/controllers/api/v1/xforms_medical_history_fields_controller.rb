class Api::V1::XformsMedicalHistoryFieldsController < ApplicationController
  before_action :set_xforms_medical_history_field, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @xforms_medical_history_fields = XformsMedicalHistoryField.all
    respond_with(@xforms_medical_history_fields)
  end

  def show
    respond_with(@xforms_medical_history_field)
  end

  def create
    @xforms_medical_history_field = XformsMedicalHistoryField.new(xforms_medical_history_field_params)
    @xforms_medical_history_field.save
    respond_with(@xforms_medical_history_field)
  end

  def update
    @xforms_medical_history_field.update(xforms_medical_history_field_params)
    respond_with(@xforms_medical_history_field)
  end

  def destroy
    @xforms_medical_history_field.destroy
    respond_with(@xforms_medical_history_field)
  end

  private
    def set_xforms_medical_history_field
      @xforms_medical_history_field = XformsMedicalHistoryField.find(params[:id])
    end

    def xforms_medical_history_field_params
      params.require(:xforms_medical_history_field).permit(:name, :tabIndex)
    end
end
