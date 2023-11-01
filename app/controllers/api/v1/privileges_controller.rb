class Api::V1::PrivilegesController < ApplicationController
  before_action :set_privilege, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @privileges = Privilege.all
    respond_with(results: @privileges)
  end

  def show
    respond_with(@privilege)
  end

  def create
    @privilege = PrivilegeService.create_privilege(privilege_params)
    respond_with(@privilege)
  end

  def update
    @privilege = PrivilegeService.update_privilege(@privilege, privilege_params)
    respond_with(@privilege)
  end

  def destroy
    @privilege.destroy
    respond_with("Privilege deleted")
  end

  private
    def set_privilege
      @privilege = Privilege.find_by_uuid(params[:id])
    end

    def privilege_params
      params.permit(:privilege, :description)
    end
end
