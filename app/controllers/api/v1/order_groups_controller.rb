class Api::V1::OrderGroupsController < ApplicationController
  before_action :set_order_group, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @order_groups = OrderGroup.all
    respond_with(@order_groups)
  end

  def show
    respond_with(@order_group)
  end

  def create
    @order_group = OrderGroup.new(order_group_params)
    @order_group.save
    respond_with(@order_group)
  end

  def update
    @order_group.update(order_group_params)
    respond_with(@order_group)
  end

  def destroy
    @order_group.destroy
    respond_with(@order_group)
  end

  private
    def set_order_group
      @order_group = OrderGroup.find(params[:id])
    end

    def order_group_params
      params.require(:order_group).permit(:order_set_id, :patient_id, :encounter_id, :creator, :date_created, :voided, :voided_by, :date_voided, :void_reason, :changed_by, :date_changed, :uuid)
    end
end
