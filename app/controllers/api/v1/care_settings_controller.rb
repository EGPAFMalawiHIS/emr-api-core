class Api::V1::CareSettingsController < ApplicationController
  before_action :set_care_setting, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @care_settings = CareSetting.all
    respond_with(@care_settings)
  end

  def show
    respond_with(@care_setting)
  end

  def create
    @care_setting = CareSetting.new(care_setting_params)
    @care_setting.save
    respond_with(@care_setting)
  end

  def update
    @care_setting.update(care_setting_params)
    respond_with(@care_setting)
  end

  def destroy
    @care_setting.destroy
    respond_with(@care_setting)
  end

  private
    def set_care_setting
      @care_setting = CareSetting.find(params[:id])
    end

    def care_setting_params
      params.require(:care_setting).permit(:name, :description, :care_setting_type, :creator, :date_created, :retired, :retired_by, :date_retired, :retire_reason, :changed_by, :date_changed, :uuid)
    end
end
