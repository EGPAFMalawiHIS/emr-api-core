class Api::V1::PersonAddressesController < ApplicationController
  before_action :set_person_address, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @person_addresses = PersonAddress.all
    respond_with(@person_addresses)
  end

  def show
    respond_with(@person_address)
  end

  def create
    @person_address = PersonAddress.new(person_address_params)
    @person_address.save
    respond_with(@person_address)
  end

  def update
    @person_address.update(person_address_params)
    respond_with(@person_address)
  end

  def destroy
    @person_address.destroy
    respond_with(@person_address)
  end

  private
    def set_person_address
      @person_address = PersonAddress.find(params[:id])
    end

    def person_address_params
      params.require(:person_address).permit(:person_id, :preferred, :address1, :address2, :city_village, :state_province, :postal_code, :country, :latitude, :longitude, :creator, :date_created, :voided, :voided_by, :date_voided, :void_reason, :county_district, :address3, :address6, :address5, :address4, :uuid, :date_changed, :changed_by, :start_date, :end_date, :address7, :address8, :address9, :address10, :address11, :address12, :address13, :address14, :address15)
    end
end
