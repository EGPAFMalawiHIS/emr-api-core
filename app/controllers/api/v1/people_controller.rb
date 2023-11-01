class Api::V1::PeopleController < ApplicationController
  before_action :set_person, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @people = Person.all
    respond_with(@people)
  end

  def show
    respond_with(@person)
  end

  def create
    @person = Person.new(person_params)
    @person.save
    respond_with(@person)
  end

  def update
    @person.update(person_params)
    respond_with(@person)
  end

  def destroy
    @person.destroy
    respond_with(@person)
  end

  private
    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:gender, :birthdate, :birthdate_estimated, :dead, :death_date, :cause_of_death, :creator, :date_created, :changed_by, :date_changed, :voided, :voided_by, :date_voided, :void_reason, :uuid, :deathdate_estimated, :birthtime, :cause_of_death_non_coded)
    end
end
