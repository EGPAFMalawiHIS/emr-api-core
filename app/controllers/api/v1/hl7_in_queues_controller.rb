class Api::V1::Hl7InQueuesController < ApplicationController
  before_action :set_hl7_in_queue, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @hl7_in_queues = Hl7InQueue.all
    respond_with(@hl7_in_queues)
  end

  def show
    respond_with(@hl7_in_queue)
  end

  def create
    @hl7_in_queue = Hl7InQueue.new(hl7_in_queue_params)
    @hl7_in_queue.save
    respond_with(@hl7_in_queue)
  end

  def update
    @hl7_in_queue.update(hl7_in_queue_params)
    respond_with(@hl7_in_queue)
  end

  def destroy
    @hl7_in_queue.destroy
    respond_with(@hl7_in_queue)
  end

  private
    def set_hl7_in_queue
      @hl7_in_queue = Hl7InQueue.find(params[:id])
    end

    def hl7_in_queue_params
      params.require(:hl7_in_queue).permit(:hl7_source, :hl7_source_key, :hl7_data, :message_state, :date_processed, :error_msg, :date_created, :uuid)
    end
end
