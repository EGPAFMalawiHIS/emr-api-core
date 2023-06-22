class Api::V1::RelationshipTypesController < ApplicationController
  before_action :set_relationship_type, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @relationship_types = RelationshipType.all
    respond_with(@relationship_types)
  end

  def show
    respond_with(@relationship_type)
  end

  def create
    @relationship_type = RelationshipType.new(relationship_type_params)
    @relationship_type.save
    respond_with(@relationship_type)
  end

  def update
    @relationship_type.update(relationship_type_params)
    respond_with(@relationship_type)
  end

  def destroy
    @relationship_type.destroy
    respond_with(@relationship_type)
  end

  private
    def set_relationship_type
      @relationship_type = RelationshipType.find(params[:id])
    end

    def relationship_type_params
      params.require(:relationship_type).permit(:a_is_to_b, :b_is_to_a, :preferred, :weight, :description, :creator, :date_created, :uuid, :retired, :retired_by, :date_retired, :retire_reason, :date_changed, :changed_by)
    end
end
