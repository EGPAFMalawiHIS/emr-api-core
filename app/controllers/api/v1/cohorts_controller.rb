class Api::V1::CohortsController < ApplicationController
  before_action :set_cohort, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @cohorts = Cohort.all
    respond_with(@cohorts)
  end

  def show
    respond_with(@cohort)
  end

  def create
    @cohort = Cohort.new(cohort_params)
    @cohort.save
    respond_with(@cohort)
  end

  def update
    @cohort.update(cohort_params)
    respond_with(@cohort)
  end

  def destroy
    @cohort.destroy
    respond_with(@cohort)
  end

  private
    def set_cohort
      @cohort = Cohort.find(params[:id])
    end

    def cohort_params
      params.require(:cohort).permit(:name, :description, :creator, :date_created, :voided, :voided_by, :date_voided, :void_reason, :changed_by, :date_changed, :uuid)
    end
end
