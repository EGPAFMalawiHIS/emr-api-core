class Api::V1::ReportingReportDesignResourcesController < ApplicationController
  before_action :set_reporting_report_design_resource, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @reporting_report_design_resources = ReportingReportDesignResource.all
    respond_with(@reporting_report_design_resources)
  end

  def show
    respond_with(@reporting_report_design_resource)
  end

  def create
    @reporting_report_design_resource = ReportingReportDesignResource.new(reporting_report_design_resource_params)
    @reporting_report_design_resource.save
    respond_with(@reporting_report_design_resource)
  end

  def update
    @reporting_report_design_resource.update(reporting_report_design_resource_params)
    respond_with(@reporting_report_design_resource)
  end

  def destroy
    @reporting_report_design_resource.destroy
    respond_with(@reporting_report_design_resource)
  end

  private
    def set_reporting_report_design_resource
      @reporting_report_design_resource = ReportingReportDesignResource.find(params[:id])
    end

    def reporting_report_design_resource_params
      params.require(:reporting_report_design_resource).permit(:uuid, :name, :description, :report_design_id, :content_type, :extension, :contents, :creator, :date_created, :changed_by, :date_changed, :retired, :retired_by, :date_retired, :retire_reason)
    end
end
