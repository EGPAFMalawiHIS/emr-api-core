class Api::V1::ReportSchemaXmlsController < ApplicationController
  before_action :set_report_schema_xml, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @report_schema_xmls = ReportSchemaXml.all
    respond_with(@report_schema_xmls)
  end

  def show
    respond_with(@report_schema_xml)
  end

  def create
    @report_schema_xml = ReportSchemaXml.new(report_schema_xml_params)
    @report_schema_xml.save
    respond_with(@report_schema_xml)
  end

  def update
    @report_schema_xml.update(report_schema_xml_params)
    respond_with(@report_schema_xml)
  end

  def destroy
    @report_schema_xml.destroy
    respond_with(@report_schema_xml)
  end

  private
    def set_report_schema_xml
      @report_schema_xml = ReportSchemaXml.find(params[:id])
    end

    def report_schema_xml_params
      params.require(:report_schema_xml).permit(:name, :description, :xml_data, :uuid)
    end
end
