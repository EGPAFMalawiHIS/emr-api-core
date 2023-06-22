class Api::V1::OrdersController < ApplicationController
  before_action :set_order, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @orders = Order.all
    respond_with(@orders)
  end

  def show
    respond_with(@order)
  end

  def create
    @order = Order.new(order_params)
    @order.save
    respond_with(@order)
  end

  def update
    @order.update(order_params)
    respond_with(@order)
  end

  def destroy
    @order.destroy
    respond_with(@order)
  end

  private
    def set_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:order_type_id, :concept_id, :orderer, :encounter_id, :instructions, :date_activated, :auto_expire_date, :date_stopped, :order_reason, :creator, :date_created, :voided, :voided_by, :date_voided, :void_reason, :patient_id, :accession_number, :uuid, :order_reason_non_coded, :urgency, :order_number, :previous_order_id, :order_action, :comment_to_fulfiller, :care_setting, :scheduled_date, :order_group_id, :sort_weight, :fulfiller_comment, :fulfiller_status)
    end
end
