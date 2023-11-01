class Api::V1::FormentryQueuesController < ApplicationController
  before_action :set_formentry_queue, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @formentry_queues = FormentryQueue.all
    respond_with(@formentry_queues)
  end

  def show
    respond_with(@formentry_queue)
  end

  def create
    @formentry_queue = FormentryQueue.new(formentry_queue_params)
    @formentry_queue.save
    respond_with(@formentry_queue)
  end

  def update
    @formentry_queue.update(formentry_queue_params)
    respond_with(@formentry_queue)
  end

  def destroy
    @formentry_queue.destroy
    respond_with(@formentry_queue)
  end

  private
    def set_formentry_queue
      @formentry_queue = FormentryQueue.find(params[:id])
    end

    def formentry_queue_params
      params.require(:formentry_queue).permit(:form_data, :creator, :date_created)
    end
end
