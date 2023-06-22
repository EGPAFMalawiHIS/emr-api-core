class Api::V1::LogicRuleTokenTagsController < ApplicationController
  before_action :set_logic_rule_token_tag, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @logic_rule_token_tags = LogicRuleTokenTag.all
    respond_with(@logic_rule_token_tags)
  end

  def show
    respond_with(@logic_rule_token_tag)
  end

  def create
    @logic_rule_token_tag = LogicRuleTokenTag.new(logic_rule_token_tag_params)
    @logic_rule_token_tag.save
    respond_with(@logic_rule_token_tag)
  end

  def update
    @logic_rule_token_tag.update(logic_rule_token_tag_params)
    respond_with(@logic_rule_token_tag)
  end

  def destroy
    @logic_rule_token_tag.destroy
    respond_with(@logic_rule_token_tag)
  end

  private
    def set_logic_rule_token_tag
      @logic_rule_token_tag = LogicRuleTokenTag.find(params[:id])
    end

    def logic_rule_token_tag_params
      params.require(:logic_rule_token_tag).permit(:logic_rule_token_id, :tag)
    end
end
