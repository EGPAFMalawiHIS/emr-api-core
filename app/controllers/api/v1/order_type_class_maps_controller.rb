class Api::V1::OrderTypeClassMapsController < ApplicationController
  before_action :set_order_type_class_map, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @order_type_class_maps = OrderTypeClassMap.all
    respond_with(@order_type_class_maps)
  end

  def show
    respond_with(@order_type_class_map)
  end

  def create
    @order_type_class_map = OrderTypeClassMap.new(order_type_class_map_params)
    @order_type_class_map.save
    respond_with(@order_type_class_map)
  end

  def update
    @order_type_class_map.update(order_type_class_map_params)
    respond_with(@order_type_class_map)
  end

  def destroy
    @order_type_class_map.destroy
    respond_with(@order_type_class_map)
  end

  private
    def set_order_type_class_map
      @order_type_class_map = OrderTypeClassMap.find(params[:id])
    end

    def order_type_class_map_params
      params.require(:order_type_class_map).permit(:order_type_id, :concept_class_id)
    end
end
