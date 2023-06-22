class Api::V1::FormentryErrorsController < ApplicationController
  before_action :set_formentry_error, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @formentry_errors = FormentryError.all
    respond_with(@formentry_errors)
  end

  def show
    respond_with(@formentry_error)
  end

  def create
    @formentry_error = FormentryError.new(formentry_error_params)
    @formentry_error.save
    respond_with(@formentry_error)
  end

  def update
    @formentry_error.update(formentry_error_params)
    respond_with(@formentry_error)
  end

  def destroy
    @formentry_error.destroy
    respond_with(@formentry_error)
  end

  private
    def set_formentry_error
      @formentry_error = FormentryError.find(params[:id])
    end

    def formentry_error_params
      params.require(:formentry_error).permit(:form_data, :error, :error_details, :creator, :date_created)
    end
end
