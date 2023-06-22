class Api::V1::RoleRolesController < ApplicationController
  before_action :set_role_role, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @role_roles = RoleRole.all
    respond_with(@role_roles)
  end

  def show
    respond_with(@role_role)
  end

  def create
    @role_role = RoleRole.new(role_role_params)
    @role_role.save
    respond_with(@role_role)
  end

  def update
    @role_role.update(role_role_params)
    respond_with(@role_role)
  end

  def destroy
    @role_role.destroy
    respond_with(@role_role)
  end

  private
    def set_role_role
      @role_role = RoleRole.find(params[:id])
    end

    def role_role_params
      params.require(:role_role).permit(:parent_role, :child_role)
    end
end
