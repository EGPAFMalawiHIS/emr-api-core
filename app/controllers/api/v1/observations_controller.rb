class Api::V1::ObsController < ApplicationController
  before_action :set_ob, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @obs = Observation.all
    respond_with(@obs)
  end

  def show
    respond_with(@ob)
  end

  def create
    @ob = Observation.new(ob_params)
    @ob.save
    respond_with(@ob)
  end

  def update
    @ob.update(ob_params)
    respond_with(@ob)
  end

  def destroy
    @ob.destroy
    respond_with(@ob)
  end

  private
    def set_ob
      @ob = Observation.find(params[:id])
    end

    def ob_params
      params.require(:ob).permit(:person_id, :concept_id, :encounter_id, :order_id, :obs_datetime, :location_id, :obs_group_id, :accession_number, :value_group_id, :value_coded, :value_coded_name_id, :value_drug, :value_datetime, :value_numeric, :value_modifier, :value_text, :comments, :creator, :date_created, :voided, :voided_by, :date_voided, :void_reason, :value_complex, :uuid, :previous_version, :form_namespace_and_path, :status, :interpretation)
    end
end
