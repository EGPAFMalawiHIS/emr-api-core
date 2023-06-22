class Api::V1::LogicRuleTokensController < ApplicationController
  before_action :set_logic_rule_token, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @logic_rule_tokens = LogicRuleToken.all
    respond_with(@logic_rule_tokens)
  end

  def show
    respond_with(@logic_rule_token)
  end

  def create
    @logic_rule_token = LogicRuleToken.new(logic_rule_token_params)
    @logic_rule_token.save
    respond_with(@logic_rule_token)
  end

  def update
    @logic_rule_token.update(logic_rule_token_params)
    respond_with(@logic_rule_token)
  end

  def destroy
    @logic_rule_token.destroy
    respond_with(@logic_rule_token)
  end

  private
    def set_logic_rule_token
      @logic_rule_token = LogicRuleToken.find(params[:id])
    end

    def logic_rule_token_params
      params.require(:logic_rule_token).permit(:creator, :date_created, :changed_by, :date_changed, :token, :class_name, :state, :uuid)
    end
end
