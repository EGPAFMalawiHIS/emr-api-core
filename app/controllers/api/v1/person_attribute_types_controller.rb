class Api::V1::PersonAttributeTypesController < ApplicationController
  before_action :set_person_attribute_type, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @person_attribute_types = PersonAttributeType.all
    respond_with(@person_attribute_types)
  end

  def show
    respond_with(@person_attribute_type)
  end

  def create
    @person_attribute_type = PersonAttributeType.new(person_attribute_type_params)
    @person_attribute_type.save
    respond_with(@person_attribute_type)
  end

  def update
    @person_attribute_type.update(person_attribute_type_params)
    respond_with(@person_attribute_type)
  end

  def destroy
    @person_attribute_type.destroy
    respond_with(@person_attribute_type)
  end

  private
    def set_person_attribute_type
      @person_attribute_type = PersonAttributeType.find(params[:id])
    end

    def person_attribute_type_params
      params.require(:person_attribute_type).permit(:name, :description, :format, :foreign_key, :searchable, :creator, :date_created, :changed_by, :date_changed, :retired, :retired_by, :date_retired, :retire_reason, :edit_privilege, :uuid, :sort_weight)
    end
end
