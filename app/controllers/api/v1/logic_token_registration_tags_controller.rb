class Api::V1::LogicTokenRegistrationTagsController < ApplicationController
  before_action :set_logic_token_registration_tag, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @logic_token_registration_tags = LogicTokenRegistrationTag.all
    respond_with(@logic_token_registration_tags)
  end

  def show
    respond_with(@logic_token_registration_tag)
  end

  def create
    @logic_token_registration_tag = LogicTokenRegistrationTag.new(logic_token_registration_tag_params)
    @logic_token_registration_tag.save
    respond_with(@logic_token_registration_tag)
  end

  def update
    @logic_token_registration_tag.update(logic_token_registration_tag_params)
    respond_with(@logic_token_registration_tag)
  end

  def destroy
    @logic_token_registration_tag.destroy
    respond_with(@logic_token_registration_tag)
  end

  private
    def set_logic_token_registration_tag
      @logic_token_registration_tag = LogicTokenRegistrationTag.find(params[:id])
    end

    def logic_token_registration_tag_params
      params.require(:logic_token_registration_tag).permit(:token_registration_id, :tag)
    end
end
