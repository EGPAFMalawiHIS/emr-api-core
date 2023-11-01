class Api::V1::TribesController < ApplicationController
  before_action :set_tribe, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @tribes = Tribe.all
    respond_with(@tribes)
  end

  def show
    respond_with(@tribe)
  end

  def create
    @tribe = Tribe.new(tribe_params)
    @tribe.save
    respond_with(@tribe)
  end

  def update
    @tribe.update(tribe_params)
    respond_with(@tribe)
  end

  def destroy
    @tribe.destroy
    respond_with(@tribe)
  end

  private
    def set_tribe
      @tribe = Tribe.find(params[:id])
    end

    def tribe_params
      params.require(:tribe).permit(:retired, :name)
    end
end
