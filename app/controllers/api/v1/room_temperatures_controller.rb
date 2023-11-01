class Api::V1::RoomTemperaturesController < ApplicationController
  before_action :set_room_temperature, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @room_temperatures = RoomTemperature.all
    respond_with(@room_temperatures)
  end

  def show
    respond_with(@room_temperature)
  end

  def create
    @room_temperature = RoomTemperature.new(room_temperature_params)
    @room_temperature.save
    respond_with(@room_temperature)
  end

  def update
    @room_temperature.update(room_temperature_params)
    respond_with(@room_temperature)
  end

  def destroy
    @room_temperature.destroy
    respond_with(@room_temperature)
  end

  private
    def set_room_temperature
      @room_temperature = RoomTemperature.find(params[:id])
    end

    def room_temperature_params
      params.require(:room_temperature).permit(:time, :temp, :uuid)
    end
end
