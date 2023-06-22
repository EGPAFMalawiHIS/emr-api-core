class Api::V1::ConceptStopWordsController < ApplicationController
  before_action :set_concept_stop_word, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_stop_words = ConceptStopWord.all
    respond_with(@concept_stop_words)
  end

  def show
    respond_with(@concept_stop_word)
  end

  def create
    @concept_stop_word = ConceptStopWord.new(concept_stop_word_params)
    @concept_stop_word.save
    respond_with(@concept_stop_word)
  end

  def update
    @concept_stop_word.update(concept_stop_word_params)
    respond_with(@concept_stop_word)
  end

  def destroy
    @concept_stop_word.destroy
    respond_with(@concept_stop_word)
  end

  private
    def set_concept_stop_word
      @concept_stop_word = ConceptStopWord.find(params[:id])
    end

    def concept_stop_word_params
      params.require(:concept_stop_word).permit(:word, :locale, :uuid)
    end
end
