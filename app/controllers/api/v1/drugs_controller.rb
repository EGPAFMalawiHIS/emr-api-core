class Api::V1::DrugsController < ApplicationController
  before_action :set_drug, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @drugs = Drug.all
    respond_with(@drugs)
  end

  def show
    respond_with(@drug)
  end

  def create
    @drug = Drug.new(drug_params)
    @drug.save
    respond_with(@drug)
  end

  def update
    @drug.update(drug_params)
    respond_with(@drug)
  end

  def destroy
    @drug.destroy
    respond_with(@drug)
  end

  private
    def set_drug
      @drug = Drug.find(params[:id])
    end

    def drug_params
      params.require(:drug).permit(:concept_id, :name, :combination, :dosage_form, :maximum_daily_dose, :minimum_daily_dose, :route, :creator, :date_created, :retired, :retired_by, :date_retired, :retire_reason, :uuid, :date_changed, :changed_by, :strength)
    end
end
