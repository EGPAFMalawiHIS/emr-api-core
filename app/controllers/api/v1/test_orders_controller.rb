class Api::V1::TestOrdersController < ApplicationController
  before_action :set_test_order, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @test_orders = TestOrder.all
    respond_with(@test_orders)
  end

  def show
    respond_with(@test_order)
  end

  def create
    @test_order = TestOrder.new(test_order_params)
    @test_order.save
    respond_with(@test_order)
  end

  def update
    @test_order.update(test_order_params)
    respond_with(@test_order)
  end

  def destroy
    @test_order.destroy
    respond_with(@test_order)
  end

  private
    def set_test_order
      @test_order = TestOrder.find(params[:id])
    end

    def test_order_params
      params.require(:test_order).permit(:specimen_source, :laterality, :clinical_history, :frequency, :number_of_repeats)
    end
end
