class Api::V1::DrugReferenceMapsController < ApplicationController
  before_action :set_drug_reference_map, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @drug_reference_maps = DrugReferenceMap.all
    respond_with(@drug_reference_maps)
  end

  def show
    respond_with(@drug_reference_map)
  end

  def create
    @drug_reference_map = DrugReferenceMap.new(drug_reference_map_params)
    @drug_reference_map.save
    respond_with(@drug_reference_map)
  end

  def update
    @drug_reference_map.update(drug_reference_map_params)
    respond_with(@drug_reference_map)
  end

  def destroy
    @drug_reference_map.destroy
    respond_with(@drug_reference_map)
  end

  private
    def set_drug_reference_map
      @drug_reference_map = DrugReferenceMap.find(params[:id])
    end

    def drug_reference_map_params
      params.require(:drug_reference_map).permit(:drug_id, :term_id, :concept_map_type, :creator, :date_created, :retired, :retired_by, :date_retired, :retire_reason, :changed_by, :date_changed, :uuid)
    end
end
