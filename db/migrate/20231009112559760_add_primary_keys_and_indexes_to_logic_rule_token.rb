# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the logic_rule_token table
class AddPrimaryKeysAndIndexesToLogicRuleToken < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE logic_rule_token ADD PRIMARY KEY (logic_rule_token_id)"
  end
end
