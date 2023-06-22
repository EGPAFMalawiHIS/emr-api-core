class Api::V1::ReportingReportRequestsController < ApplicationController
  before_action :set_reporting_report_request, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @reporting_report_requests = ReportingReportRequest.all
    respond_with(@reporting_report_requests)
  end

  def show
    respond_with(@reporting_report_request)
  end

  def create
    @reporting_report_request = ReportingReportRequest.new(reporting_report_request_params)
    @reporting_report_request.save
    respond_with(@reporting_report_request)
  end

  def update
    @reporting_report_request.update(reporting_report_request_params)
    respond_with(@reporting_report_request)
  end

  def destroy
    @reporting_report_request.destroy
    respond_with(@reporting_report_request)
  end

  private
    def set_reporting_report_request
      @reporting_report_request = ReportingReportRequest.find(params[:id])
    end

    def reporting_report_request_params
      params.require(:reporting_report_request).permit(:uuid, :base_cohort_uuid, :base_cohort_parameters, :report_definition_uuid, :report_definition_parameters, :renderer_type, :renderer_argument, :requested_by, :request_datetime, :priority, :status, :evaluation_start_datetime, :evaluation_complete_datetime, :render_complete_datetime, :description)
    end
end
