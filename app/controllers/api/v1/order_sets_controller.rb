class Api::V1::OrderSetsController < ApplicationController
  before_action :set_order_set, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @order_sets = OrderSet.all
    respond_with(@order_sets)
  end

  def show
    respond_with(@order_set)
  end

  def create
    @order_set = OrderSet.new(order_set_params)
    @order_set.save
    respond_with(@order_set)
  end

  def update
    @order_set.update(order_set_params)
    respond_with(@order_set)
  end

  def destroy
    @order_set.destroy
    respond_with(@order_set)
  end

  private
    def set_order_set
      @order_set = OrderSet.find(params[:id])
    end

    def order_set_params
      params.require(:order_set).permit(:operator, :name, :description, :creator, :date_created, :retired, :retired_by, :date_retired, :retire_reason, :changed_by, :date_changed, :uuid)
    end
end
