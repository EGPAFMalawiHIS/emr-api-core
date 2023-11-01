class Api::V1::ConceptWordsController < ApplicationController
  before_action :set_concept_word, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_words = ConceptWord.all
    respond_with(@concept_words)
  end

  def show
    respond_with(@concept_word)
  end

  def create
    @concept_word = ConceptWord.new(concept_word_params)
    @concept_word.save
    respond_with(@concept_word)
  end

  def update
    @concept_word.update(concept_word_params)
    respond_with(@concept_word)
  end

  def destroy
    @concept_word.destroy
    respond_with(@concept_word)
  end

  private
    def set_concept_word
      @concept_word = ConceptWord.find(params[:id])
    end

    def concept_word_params
      params.require(:concept_word).permit(:concept_id, :word, :locale, :concept_name_id, :weight)
    end
end
