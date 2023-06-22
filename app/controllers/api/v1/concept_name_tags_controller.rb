class Api::V1::ConceptNameTagsController < ApplicationController
  before_action :set_concept_name_tag, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_name_tags = ConceptNameTag.all
    respond_with(@concept_name_tags)
  end

  def show
    respond_with(@concept_name_tag)
  end

  def create
    @concept_name_tag = ConceptNameTag.new(concept_name_tag_params)
    @concept_name_tag.save
    respond_with(@concept_name_tag)
  end

  def update
    @concept_name_tag.update(concept_name_tag_params)
    respond_with(@concept_name_tag)
  end

  def destroy
    @concept_name_tag.destroy
    respond_with(@concept_name_tag)
  end

  private
    def set_concept_name_tag
      @concept_name_tag = ConceptNameTag.find(params[:id])
    end

    def concept_name_tag_params
      params.require(:concept_name_tag).permit(:tag, :description, :creator, :date_created, :voided, :voided_by, :date_voided, :void_reason, :uuid, :date_changed, :changed_by)
    end
end
