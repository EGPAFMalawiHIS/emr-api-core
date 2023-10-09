# frozen_string_literal: true

# Migration responsible for adding foreign keys to the logic_rule_token_tag table
class AddForeignKeysToLogicRuleTokenTag < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :logic_rule_token_tag, :logic_rule_token, column: :logic_rule_token_id, primary_key: :logic_rule_token_id
  end
end
