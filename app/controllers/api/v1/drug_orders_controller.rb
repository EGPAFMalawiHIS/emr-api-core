class Api::V1::DrugOrdersController < ApplicationController
  before_action :set_drug_order, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @drug_orders = DrugOrder.all
    respond_with(@drug_orders)
  end

  def show
    respond_with(@drug_order)
  end

  def create
    @drug_order = DrugOrder.new(drug_order_params)
    @drug_order.save
    respond_with(@drug_order)
  end

  def update
    @drug_order.update(drug_order_params)
    respond_with(@drug_order)
  end

  def destroy
    @drug_order.destroy
    respond_with(@drug_order)
  end

  private
    def set_drug_order
      @drug_order = DrugOrder.find(params[:id])
    end

    def drug_order_params
      params.require(:drug_order).permit(:drug_inventory_id, :dose, :as_needed, :dosing_type, :quantity, :as_needed_condition, :num_refills, :dosing_instructions, :duration, :duration_units, :quantity_units, :route, :dose_units, :frequency, :brand_name, :dispense_as_written, :drug_non_coded)
    end
end
