class Api::V1::LogicRuleDefinitionsController < ApplicationController
  before_action :set_logic_rule_definition, only: [:show, :update, :destroy]

  respond_to :json

  def index
    @logic_rule_definitions = LogicRuleDefinition.all
    respond_with(@logic_rule_definitions)
  end

  def show
    respond_with(@logic_rule_definition)
  end

  def create
    @logic_rule_definition = LogicRuleDefinition.new(logic_rule_definition_params)
    @logic_rule_definition.save
    respond_with(@logic_rule_definition)
  end

  def update
    @logic_rule_definition.update(logic_rule_definition_params)
    respond_with(@logic_rule_definition)
  end

  def destroy
    @logic_rule_definition.destroy
    respond_with(@logic_rule_definition)
  end

  private
    def set_logic_rule_definition
      @logic_rule_definition = LogicRuleDefinition.find(params[:id])
    end

    def logic_rule_definition_params
      params.require(:logic_rule_definition).permit(:uuid, :name, :description, :rule_content, :language, :creator, :date_created, :changed_by, :date_changed, :retired, :retired_by, :date_retired, :retire_reason)
    end
end
