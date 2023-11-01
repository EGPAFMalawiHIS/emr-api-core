class Api::V1::UserPropertiesController < ApplicationController
  before_action :set_user_property, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @user_properties = UserProperty.all
    respond_with(@user_properties)
  end

  def show
    respond_with(@user_property)
  end

  def create
    @user_property = UserProperty.new(user_property_params)
    @user_property.save
    respond_with(@user_property)
  end

  def update
    @user_property.update(user_property_params)
    respond_with(@user_property)
  end

  def destroy
    @user_property.destroy
    respond_with(@user_property)
  end

  private
    def set_user_property
      @user_property = UserProperty.find(params[:id])
    end

    def user_property_params
      params.require(:user_property).permit(:user_id, :property, :property_value)
    end
end
