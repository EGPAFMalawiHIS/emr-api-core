class Api::V1::FormFieldsController < ApplicationController
  before_action :set_form_field, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @form_fields = FormField.all
    respond_with(@form_fields)
  end

  def show
    respond_with(@form_field)
  end

  def create
    @form_field = FormField.new(form_field_params)
    @form_field.save
    respond_with(@form_field)
  end

  def update
    @form_field.update(form_field_params)
    respond_with(@form_field)
  end

  def destroy
    @form_field.destroy
    respond_with(@form_field)
  end

  private
    def set_form_field
      @form_field = FormField.find(params[:id])
    end

    def form_field_params
      params.require(:form_field).permit(:form_id, :field_id, :field_number, :field_part, :page_number, :parent_form_field, :min_occurs, :max_occurs, :required, :changed_by, :date_changed, :creator, :date_created, :sort_weight, :uuid)
    end
end
