class Api::V1::LogicTokenRegistrationsController < ApplicationController
  before_action :set_logic_token_registration, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @logic_token_registrations = LogicTokenRegistration.all
    respond_with(@logic_token_registrations)
  end

  def show
    respond_with(@logic_token_registration)
  end

  def create
    @logic_token_registration = LogicTokenRegistration.new(logic_token_registration_params)
    @logic_token_registration.save
    respond_with(@logic_token_registration)
  end

  def update
    @logic_token_registration.update(logic_token_registration_params)
    respond_with(@logic_token_registration)
  end

  def destroy
    @logic_token_registration.destroy
    respond_with(@logic_token_registration)
  end

  private
    def set_logic_token_registration
      @logic_token_registration = LogicTokenRegistration.find(params[:id])
    end

    def logic_token_registration_params
      params.require(:logic_token_registration).permit(:creator, :date_created, :changed_by, :date_changed, :token, :provider_class_name, :provider_token, :configuration, :uuid)
    end
end
