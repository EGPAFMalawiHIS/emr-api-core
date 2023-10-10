# frozen_string_literal: true

# Model: LogicRuleTokenTag
class LogicRuleTokenTag < ApplicationRecord
  self.table_name = 'logic_rule_token_tag'
  validates :logic_rule_token_id, presence: true
  validates :tag, presence: true
end
