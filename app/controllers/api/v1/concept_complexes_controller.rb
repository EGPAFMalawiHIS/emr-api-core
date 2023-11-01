class Api::V1::ConceptComplexesController < ApplicationController
  before_action :set_concept_complex, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_complexes = ConceptComplex.all
    respond_with(@concept_complexes)
  end

  def show
    respond_with(@concept_complex)
  end

  def create
    @concept_complex = ConceptComplex.new(concept_complex_params)
    @concept_complex.save
    respond_with(@concept_complex)
  end

  def update
    @concept_complex.update(concept_complex_params)
    respond_with(@concept_complex)
  end

  def destroy
    @concept_complex.destroy
    respond_with(@concept_complex)
  end

  private
    def set_concept_complex
      @concept_complex = ConceptComplex.find(params[:id])
    end

    def concept_complex_params
      params.require(:concept_complex).permit(:handler)
    end
end
