class Api::V1::VisitsController < ApplicationController
  respond_to :json

  def index
    visits = VisitService.find_visits(ParamConstants::VISIT_SEARCH_PARAMS)
    respond_with(visits)
  end

  def show
    respond_with(Visit.find_by_uuid(params[:id]))
  end

  def create
    create_params = params.permit ParamConstants::VISIT_WHITELISTED_PARAMS

    visit = VisitService.create_visit(create_params)
    render json: visit, status: :created
  end

  def update
    update_params = params.permit ParamConstants::VISIT_WHITELISTED_PARAMS

    visit = Visit.find_by_uuid(params[:id])
    render json: VisitService.update_visit(visit, update_params), status: :ok
  end

  def destroy
    Visit.find_by_uuid(params[:id]).void(ParamConstants::VISIT_WHITELISTED_PARAMS)
    render json: {}, status: :ok
  end
end
