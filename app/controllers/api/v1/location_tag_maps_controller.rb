class Api::V1::LocationTagMapsController < ApplicationController
  before_action :set_location_tag_map, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @location_tag_maps = LocationTagMap.all
    respond_with(@location_tag_maps)
  end

  def show
    respond_with(@location_tag_map)
  end

  def create
    @location_tag_map = LocationTagMap.new(location_tag_map_params)
    @location_tag_map.save
    respond_with(@location_tag_map)
  end

  def update
    @location_tag_map.update(location_tag_map_params)
    respond_with(@location_tag_map)
  end

  def destroy
    @location_tag_map.destroy
    respond_with(@location_tag_map)
  end

  private
    def set_location_tag_map
      @location_tag_map = LocationTagMap.find(params[:id])
    end

    def location_tag_map_params
      params.require(:location_tag_map).permit(:location_id, :location_tag_id)
    end
end
