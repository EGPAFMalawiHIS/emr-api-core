# frozen_string_literal: true

# Model: LogicRuleDefinition
class LogicRuleDefinition < ApplicationRecord
  self.table_name = 'logic_rule_definition'
  self.primary_key = 'id'

  validates :uuid, presence: true
  validates :name, presence: true
  validates :rule_content, presence: true
  validates :language, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
end
