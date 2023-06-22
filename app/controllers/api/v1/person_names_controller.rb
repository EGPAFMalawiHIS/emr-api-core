class Api::V1::PersonNamesController < ApplicationController
  before_action :set_person_name, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @person_names = PersonName.all
    respond_with(@person_names)
  end

  def show
    respond_with(@person_name)
  end

  def create
    @person_name = PersonName.new(person_name_params)
    @person_name.save
    respond_with(@person_name)
  end

  def update
    @person_name.update(person_name_params)
    respond_with(@person_name)
  end

  def destroy
    @person_name.destroy
    respond_with(@person_name)
  end

  private
    def set_person_name
      @person_name = PersonName.find(params[:id])
    end

    def person_name_params
      params.require(:person_name).permit(:preferred, :person_id, :prefix, :given_name, :middle_name, :family_name_prefix, :family_name, :family_name2, :family_name_suffix, :degree, :creator, :date_created, :voided, :voided_by, :date_voided, :void_reason, :changed_by, :date_changed, :uuid)
    end
end
