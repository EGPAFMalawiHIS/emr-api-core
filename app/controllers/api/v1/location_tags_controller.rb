class Api::V1::LocationTagsController < ApplicationController
  before_action :set_location_tag, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @location_tags = LocationTag.all
    respond_with(@location_tags)
  end

  def show
    respond_with(@location_tag)
  end

  def create
    @location_tag = LocationTag.new(location_tag_params)
    @location_tag.save
    respond_with(@location_tag)
  end

  def update
    @location_tag.update(location_tag_params)
    respond_with(@location_tag)
  end

  def destroy
    @location_tag.destroy
    respond_with(@location_tag)
  end

  private
    def set_location_tag
      @location_tag = LocationTag.find(params[:id])
    end

    def location_tag_params
      params.require(:location_tag).permit(:name, :description, :creator, :date_created, :retired, :retired_by, :date_retired, :retire_reason, :uuid, :changed_by, :date_changed)
    end
end
