class Api::V1::ConceptClassesController < ApplicationController
  before_action :set_concept_class, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @concept_classes = ConceptClass.all
    respond_with(@concept_classes)
  end

  def show
    respond_with(@concept_class)
  end

  def create
    @concept_class = ConceptClass.new(concept_class_params)
    @concept_class.save
    respond_with(@concept_class)
  end

  def update
    @concept_class.update(concept_class_params)
    respond_with(@concept_class)
  end

  def destroy
    @concept_class.destroy
    respond_with(@concept_class)
  end

  private
    def set_concept_class
      @concept_class = ConceptClass.find(params[:id])
    end

    def concept_class_params
      params.require(:concept_class).permit(:name, :description, :creator, :date_created, :retired, :retired_by, :date_retired, :retire_reason, :uuid, :date_changed, :changed_by)
    end
end
