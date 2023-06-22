class Api::V1::RolesController < ApplicationController
  before_action :set_role, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @roles = Role.all
    respond_with(@roles)
  end

  def show
    respond_with(@role)
  end

  def create
    @role = Role.new(role_params)
    @role.save
    respond_with(@role)
  end

  def update
    @role.update(role_params)
    respond_with(@role)
  end

  def destroy
    @role.destroy
    respond_with(@role)
  end

  private
    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:description, :uuid)
    end
end
