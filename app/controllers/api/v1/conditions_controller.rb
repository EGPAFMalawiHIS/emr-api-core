class Api::V1::ConditionsController < ApplicationController
  before_action :set_condition, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @conditions = Condition.all
    respond_with(@conditions)
  end

  def show
    respond_with(@condition)
  end

  def create
    @condition = Condition.new(condition_params)
    @condition.save
    respond_with(@condition)
  end

  def update
    @condition.update(condition_params)
    respond_with(@condition)
  end

  def destroy
    @condition.destroy
    respond_with(@condition)
  end

  private
    def set_condition
      @condition = Condition.find(params[:id])
    end

    def condition_params
      params.require(:condition).permit(:additional_detail, :previous_version, :condition_coded, :condition_non_coded, :condition_coded_name, :clinical_status, :verification_status, :onset_date, :date_created, :voided, :date_voided, :void_reason, :uuid, :creator, :voided_by, :changed_by, :patient_id, :end_date)
    end
end
