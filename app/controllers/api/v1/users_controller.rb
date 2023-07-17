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
    @user = User.new(user_params)
    @user.save
    respond_with(@user)
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
