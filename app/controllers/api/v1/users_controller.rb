class Api::V1::UsersController < ApplicationController
  respond_to :json
  include ParamConstants

  def index
    @users = User.all
    respond_with(results: @users)
  end

  def show
    respond_with(@user)
  end

  def create
    whitelisted = params.permit ParamConstants::USER_WHITELISTED_PARAMS
    person_params = whitelisted.delete(:person)
    role_params = whitelisted.delete(:roles)
    
    user = UserService.create_user(whitelisted, person_params, role_params)
    
    render json: user, status: :created
  end

  def update
  end
end
