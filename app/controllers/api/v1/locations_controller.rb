class Api::V1::LocationsController < ApplicationController
  before_action :set_location, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @locations = Location.all
    respond_with(@locations)
  end

  def show
    respond_with(@location)
  end

  def create
    @location = Location.new(location_params)
    @location.save
    respond_with(@location)
  end

  def update
    @location.update(location_params)
    respond_with(@location)
  end

  def destroy
    @location.destroy
    respond_with(@location)
  end

  private
    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:name, :description, :address1, :address2, :city_village, :state_province, :postal_code, :country, :latitude, :longitude, :creator, :date_created, :county_district, :address3, :address6, :address5, :address4, :retired, :retired_by, :date_retired, :retire_reason, :parent_location, :uuid, :changed_by, :date_changed, :address7, :address8, :address9, :address10, :address11, :address12, :address13, :address14, :address15)
    end
end
