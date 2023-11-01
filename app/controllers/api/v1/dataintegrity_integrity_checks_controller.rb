class Api::V1::DataintegrityIntegrityChecksController < ApplicationController
  before_action :set_dataintegrity_integrity_check, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @dataintegrity_integrity_checks = DataintegrityIntegrityCheck.all
    respond_with(@dataintegrity_integrity_checks)
  end

  def show
    respond_with(@dataintegrity_integrity_check)
  end

  def create
    @dataintegrity_integrity_check = DataintegrityIntegrityCheck.new(dataintegrity_integrity_check_params)
    @dataintegrity_integrity_check.save
    respond_with(@dataintegrity_integrity_check)
  end

  def update
    @dataintegrity_integrity_check.update(dataintegrity_integrity_check_params)
    respond_with(@dataintegrity_integrity_check)
  end

  def destroy
    @dataintegrity_integrity_check.destroy
    respond_with(@dataintegrity_integrity_check)
  end

  private
    def set_dataintegrity_integrity_check
      @dataintegrity_integrity_check = DataintegrityIntegrityCheck.find(params[:id])
    end

    def dataintegrity_integrity_check_params
      params.require(:dataintegrity_integrity_check).permit(:check_name, :check_type, :check_code, :check_result_type, :check_fail, :check_fail_operator, :check_repair_type, :check_repair, :check_parameters)
    end
end
