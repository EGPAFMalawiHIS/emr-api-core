class Api::V1::ReportObjectsController < ApplicationController
  before_action :set_report_object, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @report_objects = ReportObject.all
    respond_with(@report_objects)
  end

  def show
    respond_with(@report_object)
  end

  def create
    @report_object = ReportObject.new(report_object_params)
    @report_object.save
    respond_with(@report_object)
  end

  def update
    @report_object.update(report_object_params)
    respond_with(@report_object)
  end

  def destroy
    @report_object.destroy
    respond_with(@report_object)
  end

  private
    def set_report_object
      @report_object = ReportObject.find(params[:id])
    end

    def report_object_params
      params.require(:report_object).permit(:name, :description, :report_object_type, :report_object_sub_type, :xml_data, :creator, :date_created, :changed_by, :date_changed, :voided, :voided_by, :date_voided, :void_reason, :uuid)
    end
end
