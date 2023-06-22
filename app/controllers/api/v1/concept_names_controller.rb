class Api::V1::ConceptNamesController < ApplicationController
  before_action :set_concept_name, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_names = ConceptName.all
    respond_with(@concept_names)
  end

  def show
    respond_with(@concept_name)
  end

  def create
    @concept_name = ConceptName.new(concept_name_params)
    @concept_name.save
    respond_with(@concept_name)
  end

  def update
    @concept_name.update(concept_name_params)
    respond_with(@concept_name)
  end

  def destroy
    @concept_name.destroy
    respond_with(@concept_name)
  end

  private
    def set_concept_name
      @concept_name = ConceptName.find(params[:id])
    end

    def concept_name_params
      params.require(:concept_name).permit(:concept_id, :name, :locale, :creator, :date_created, :voided, :voided_by, :date_voided, :void_reason, :uuid, :concept_name_type, :locale_preferred, :date_changed, :changed_by)
    end
end
