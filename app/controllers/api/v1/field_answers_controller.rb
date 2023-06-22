class Api::V1::FieldAnswersController < ApplicationController
  before_action :set_field_answer, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @field_answers = FieldAnswer.all
    respond_with(@field_answers)
  end

  def show
    respond_with(@field_answer)
  end

  def create
    @field_answer = FieldAnswer.new(field_answer_params)
    @field_answer.save
    respond_with(@field_answer)
  end

  def update
    @field_answer.update(field_answer_params)
    respond_with(@field_answer)
  end

  def destroy
    @field_answer.destroy
    respond_with(@field_answer)
  end

  private
    def set_field_answer
      @field_answer = FieldAnswer.find(params[:id])
    end

    def field_answer_params
      params.require(:field_answer).permit(:field_id, :answer_id, :creator, :date_created, :uuid)
    end
end
