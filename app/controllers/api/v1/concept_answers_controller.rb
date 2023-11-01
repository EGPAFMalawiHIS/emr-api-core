class Api::V1::ConceptAnswersController < ApplicationController
  before_action :set_concept_answer, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_answers = ConceptAnswer.all
    respond_with(@concept_answers)
  end

  def show
    respond_with(@concept_answer)
  end

  def create
    @concept_answer = ConceptAnswer.new(concept_answer_params)
    @concept_answer.save
    respond_with(@concept_answer)
  end

  def update
    @concept_answer.update(concept_answer_params)
    respond_with(@concept_answer)
  end

  def destroy
    @concept_answer.destroy
    respond_with(@concept_answer)
  end

  private
    def set_concept_answer
      @concept_answer = ConceptAnswer.find(params[:id])
    end

    def concept_answer_params
      params.require(:concept_answer).permit(:concept_id, :answer_concept, :answer_drug, :creator, :date_created, :uuid, :sort_weight)
    end
end
