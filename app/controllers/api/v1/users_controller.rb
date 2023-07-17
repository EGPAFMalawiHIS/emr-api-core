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
    @user.update(user_params)
    respond_with(@user)
  end

  def destroy
    @user.destroy
    respond_with(@user)
  end

  private
    def set_user
      @user = User.find_by_uuid(params[:id])
    end

    def user_params
      params.require(:user).permit(:system_id, :username, :password, :salt, :secret_question, :secret_answer, :creator, :date_created, :changed_by, :date_changed, :person_id, :retired, :retired_by, :date_retired, :retire_reason, :uuid, :activation_key, :email)
    end
end
