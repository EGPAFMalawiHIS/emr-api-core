class Api::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @users = User.all
    respond_with(results: @users)
  end

  def show
    respond_with(@user)
  end

  def create

    user_params = params.permit(:username, :password)

    person_params = params.require(:person).permit(
      :gender, :birthdate, :birthdate_estimated, :creator, 
      names: [:given_name, :family_name], 
      addresses: [:address1, :city_village, :country, :postal_code]
    )

    role_params = params.require(:roles).map { |role| role.permit(:name, :description) }

    user = UserService.create_user(user_params, person_params, role_params)
    
    render json: user, status: :created
  end

  def update
    user_params = params.permit(:username)
    person_params = params.require(:person).permit(
      :gender, :birthdate, :birthdate_estimated, :creator, 
      names: [:given_name, :family_name], 
      addresses: [:address1, :city_village, :country, :postal_code]
    )

    role_params = params.require(:roles).map { |role| role.permit(:name, :description) }

    updated_user = UserService.update_user(@user, user_params, person_params, role_params)

    render json: updated_user, status: :ok
  end

  def destroy
    @user.void(params[:reason])
    respond_with("User voided successfully")
  end

  private
    def set_user
      @user = User.find_by_uuid(params[:id])
    end
end
