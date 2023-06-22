class Api::V1::Hl7InErrorsController < ApplicationController
  before_action :set_hl7_in_error, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @hl7_in_errors = Hl7InError.all
    respond_with(@hl7_in_errors)
  end

  def show
    respond_with(@hl7_in_error)
  end

  def create
    @hl7_in_error = Hl7InError.new(hl7_in_error_params)
    @hl7_in_error.save
    respond_with(@hl7_in_error)
  end

  def update
    @hl7_in_error.update(hl7_in_error_params)
    respond_with(@hl7_in_error)
  end

  def destroy
    @hl7_in_error.destroy
    respond_with(@hl7_in_error)
  end

  private
    def set_hl7_in_error
      @hl7_in_error = Hl7InError.find(params[:id])
    end

    def hl7_in_error_params
      params.require(:hl7_in_error).permit(:hl7_source, :hl7_source_key, :hl7_data, :error, :error_details, :date_created, :uuid)
    end
end
