class Api::V1::OrderSetMembersController < ApplicationController
  before_action :set_order_set_member, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @order_set_members = OrderSetMember.all
    respond_with(@order_set_members)
  end

  def show
    respond_with(@order_set_member)
  end

  def create
    @order_set_member = OrderSetMember.new(order_set_member_params)
    @order_set_member.save
    respond_with(@order_set_member)
  end

  def update
    @order_set_member.update(order_set_member_params)
    respond_with(@order_set_member)
  end

  def destroy
    @order_set_member.destroy
    respond_with(@order_set_member)
  end

  private
    def set_order_set_member
      @order_set_member = OrderSetMember.find(params[:id])
    end

    def order_set_member_params
      params.require(:order_set_member).permit(:order_type, :order_template, :order_template_type, :order_set_id, :sequence_number, :concept_id, :creator, :date_created, :retired, :retired_by, :date_retired, :retire_reason, :changed_by, :date_changed, :uuid)
    end
end
