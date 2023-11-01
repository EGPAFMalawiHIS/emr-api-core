class Api::V1::OrderFrequenciesController < ApplicationController
  before_action :set_order_frequency, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @order_frequencies = OrderFrequency.all
    respond_with(@order_frequencies)
  end

  def show
    respond_with(@order_frequency)
  end

  def create
    @order_frequency = OrderFrequency.new(order_frequency_params)
    @order_frequency.save
    respond_with(@order_frequency)
  end

  def update
    @order_frequency.update(order_frequency_params)
    respond_with(@order_frequency)
  end

  def destroy
    @order_frequency.destroy
    respond_with(@order_frequency)
  end

  private
    def set_order_frequency
      @order_frequency = OrderFrequency.find(params[:id])
    end

    def order_frequency_params
      params.require(:order_frequency).permit(:concept_id, :frequency_per_day, :creator, :date_created, :retired, :retired_by, :date_retired, :retire_reason, :changed_by, :date_changed, :uuid)
    end
end
