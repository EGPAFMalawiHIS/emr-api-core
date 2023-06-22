class Api::V1::AllergiesController < ApplicationController
  before_action :set_allergy, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @allergies = Allergy.all
    respond_with(@allergies)
  end

  def show
    respond_with(@allergy)
  end

  def create
    @allergy = Allergy.new(allergy_params)
    @allergy.save
    respond_with(@allergy)
  end

  def update
    @allergy.update(allergy_params)
    respond_with(@allergy)
  end

  def destroy
    @allergy.destroy
    respond_with(@allergy)
  end

  private
    def set_allergy
      @allergy = Allergy.find(params[:id])
    end

    def allergy_params
      params.require(:allergy).permit(:patient_id, :severity_concept_id, :coded_allergen, :non_coded_allergen, :allergen_type, :comment, :creator, :date_created, :changed_by, :date_changed, :voided, :voided_by, :date_voided, :void_reason, :uuid)
    end
end
