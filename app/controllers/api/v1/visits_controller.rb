class Api::V1::VisitsController < ApplicationController
  before_action :set_visit, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @visits = Visit.all
    respond_with(@visits)
  end

  def show
    respond_with(@visit)
  end

  def create
    @visit = Visit.new(visit_params)
    @visit.save
    respond_with(@visit)
  end

  def update
    @visit.update(visit_params)
    respond_with(@visit)
  end

  def destroy
    @visit.destroy
    respond_with(@visit)
  end

  private
    def set_visit
      @visit = Visit.find(params[:id])
    end

    def visit_params
      params.require(:visit).permit(:patient_id, :visit_type_id, :date_started, :date_stopped, :indication_concept_id, :location_id, :creator, :date_created, :changed_by, :date_changed, :voided, :voided_by, :date_voided, :void_reason, :uuid)
    end
end
