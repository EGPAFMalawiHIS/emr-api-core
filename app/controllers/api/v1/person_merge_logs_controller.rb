class Api::V1::PersonMergeLogsController < ApplicationController
  before_action :set_person_merge_log, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @person_merge_logs = PersonMergeLog.all
    respond_with(@person_merge_logs)
  end

  def show
    respond_with(@person_merge_log)
  end

  def create
    @person_merge_log = PersonMergeLog.new(person_merge_log_params)
    @person_merge_log.save
    respond_with(@person_merge_log)
  end

  def update
    @person_merge_log.update(person_merge_log_params)
    respond_with(@person_merge_log)
  end

  def destroy
    @person_merge_log.destroy
    respond_with(@person_merge_log)
  end

  private
    def set_person_merge_log
      @person_merge_log = PersonMergeLog.find(params[:id])
    end

    def person_merge_log_params
      params.require(:person_merge_log).permit(:winner_person_id, :loser_person_id, :creator, :date_created, :merged_data, :uuid, :changed_by, :date_changed, :voided, :voided_by, :date_voided, :void_reason)
    end
end
