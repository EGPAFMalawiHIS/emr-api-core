class Api::V1::VisitTypesController < ApplicationController
  before_action :set_visit_type, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @visit_types = VisitType.all
    respond_with(@visit_types)
  end

  def show
    respond_with(@visit_type)
  end

  def create
    @visit_type = VisitType.new(visit_type_params)
    @visit_type.save
    respond_with(@visit_type)
  end

  def update
    @visit_type.update(visit_type_params)
    respond_with(@visit_type)
  end

  def destroy
    @visit_type.destroy
    respond_with(@visit_type)
  end

  private
    def set_visit_type
      @visit_type = VisitType.find(params[:id])
    end

    def visit_type_params
      params.require(:visit_type).permit(:name, :description, :uuid, :creator, :date_created, :changed_by, :date_changed, :retired, :retired_by, :date_retired, :retire_reason)
    end
end
