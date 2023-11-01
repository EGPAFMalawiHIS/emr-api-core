class Api::V1::XformsXformsController < ApplicationController
  before_action :set_xforms_xform, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @xforms_xforms = XformsXform.all
    respond_with(@xforms_xforms)
  end

  def show
    respond_with(@xforms_xform)
  end

  def create
    @xforms_xform = XformsXform.new(xforms_xform_params)
    @xforms_xform.save
    respond_with(@xforms_xform)
  end

  def update
    @xforms_xform.update(xforms_xform_params)
    respond_with(@xforms_xform)
  end

  def destroy
    @xforms_xform.destroy
    respond_with(@xforms_xform)
  end

  private
    def set_xforms_xform
      @xforms_xform = XformsXform.find(params[:id])
    end

    def xforms_xform_params
      params.require(:xforms_xform).permit(:xform_xml, :layout_xml, :creator, :date_created, :changed_by, :date_changed, :locale_xml, :javascript_src)
    end
end
