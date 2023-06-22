class Api::V1::OrderTypesController < ApplicationController
  before_action :set_order_type, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @order_types = OrderType.all
    respond_with(@order_types)
  end

  def show
    respond_with(@order_type)
  end

  def create
    @order_type = OrderType.new(order_type_params)
    @order_type.save
    respond_with(@order_type)
  end

  def update
    @order_type.update(order_type_params)
    respond_with(@order_type)
  end

  def destroy
    @order_type.destroy
    respond_with(@order_type)
  end

  private
    def set_order_type
      @order_type = OrderType.find(params[:id])
    end

    def order_type_params
      params.require(:order_type).permit(:name, :description, :creator, :date_created, :retired, :retired_by, :date_retired, :retire_reason, :uuid, :java_class_name, :parent, :changed_by, :date_changed)
    end
end
