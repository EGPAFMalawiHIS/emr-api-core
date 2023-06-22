class Api::V1::FormentryXsnsController < ApplicationController
  before_action :set_formentry_xsn, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @formentry_xsns = FormentryXsn.all
    respond_with(@formentry_xsns)
  end

  def show
    respond_with(@formentry_xsn)
  end

  def create
    @formentry_xsn = FormentryXsn.new(formentry_xsn_params)
    @formentry_xsn.save
    respond_with(@formentry_xsn)
  end

  def update
    @formentry_xsn.update(formentry_xsn_params)
    respond_with(@formentry_xsn)
  end

  def destroy
    @formentry_xsn.destroy
    respond_with(@formentry_xsn)
  end

  private
    def set_formentry_xsn
      @formentry_xsn = FormentryXsn.find(params[:id])
    end

    def formentry_xsn_params
      params.require(:formentry_xsn).permit(:form_id, :xsn_data, :creator, :date_created, :archived, :archived_by, :date_archived, :uuid)
    end
end
