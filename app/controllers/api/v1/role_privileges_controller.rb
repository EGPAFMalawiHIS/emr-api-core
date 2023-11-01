class Api::V1::RolePrivilegesController < ApplicationController
  before_action :set_role_privilege, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @role_privileges = RolePrivilege.all
    respond_with(@role_privileges)
  end

  def show
    respond_with(@role_privilege)
  end

  def create
    @role_privilege = RolePrivilege.new(role_privilege_params)
    @role_privilege.save
    respond_with(@role_privilege)
  end

  def update
    @role_privilege.update(role_privilege_params)
    respond_with(@role_privilege)
  end

  def destroy
    @role_privilege.destroy
    respond_with(@role_privilege)
  end

  private
    def set_role_privilege
      @role_privilege = RolePrivilege.find(params[:id])
    end

    def role_privilege_params
      params.require(:role_privilege).permit(:role, :privilege)
    end
end
