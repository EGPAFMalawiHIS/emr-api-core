class Api::V1::ReportingReportDesignsController < ApplicationController
  before_action :set_reporting_report_design, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @reporting_report_designs = ReportingReportDesign.all
    respond_with(@reporting_report_designs)
  end

  def show
    respond_with(@reporting_report_design)
  end

  def create
    @reporting_report_design = ReportingReportDesign.new(reporting_report_design_params)
    @reporting_report_design.save
    respond_with(@reporting_report_design)
  end

  def update
    @reporting_report_design.update(reporting_report_design_params)
    respond_with(@reporting_report_design)
  end

  def destroy
    @reporting_report_design.destroy
    respond_with(@reporting_report_design)
  end

  private
    def set_reporting_report_design
      @reporting_report_design = ReportingReportDesign.find(params[:id])
    end

    def reporting_report_design_params
      params.require(:reporting_report_design).permit(:uuid, :name, :description, :report_definition_id, :renderer_type, :properties, :creator, :date_created, :changed_by, :date_changed, :retired, :retired_by, :date_retired, :retire_reason)
    end
end
