# frozen_string_literal: true

# Model: LogicRuleDefinition
class LogicRuleDefinition < ApplicationRecord
  self.table_name = 'logic_rule_definition'
  self.primary_key = 'id'

  belongs_to :user, class_name: 'User', foreign_key: :creator, primary_key: :user_id, optional: true
  belongs_to :forcer, class_name: 'User', foreign_key: :retired_by, primary_key: :user_id, optional: true

  validates :uuid, presence: true
  validates :name, presence: true
  validates :rule_content, presence: true
  validates :language, presence: true
  validates :creator, presence: true
  validates :date_created, presence: true
  validates :retired, presence: true
end
