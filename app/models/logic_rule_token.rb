# frozen_string_literal: true

# Model: LogicRuleToken
class LogicRuleToken < ApplicationRecord
  self.table_name = 'logic_rule_token'
  self.primary_key = 'logic_rule_token_id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  has_many :logic_rule_token_tag, foreign_key: logic_rule_token_id, primary_key: logic_rule_token_id

  validates :creator, presence: true
  validates :date_created, presence: true
  validates :token, presence: true
  validates :class_name, presence: true
  validates :uuid, presence: true
end
