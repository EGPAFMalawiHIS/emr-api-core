class Api::V1::RelationshipsController < ApplicationController
  before_action :set_relationship, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @relationships = Relationship.all
    respond_with(@relationships)
  end

  def show
    respond_with(@relationship)
  end

  def create
    @relationship = Relationship.new(relationship_params)
    @relationship.save
    respond_with(@relationship)
  end

  def update
    @relationship.update(relationship_params)
    respond_with(@relationship)
  end

  def destroy
    @relationship.destroy
    respond_with(@relationship)
  end

  private
    def set_relationship
      @relationship = Relationship.find(params[:id])
    end

    def relationship_params
      params.require(:relationship).permit(:person_a, :relationship, :person_b, :creator, :date_created, :voided, :voided_by, :date_voided, :void_reason, :uuid, :date_changed, :changed_by, :start_date, :end_date)
    end
end
