# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the logic_rule_definition table
class AddPrimaryKeysAndIndexesToLogicRuleDefinition < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE logic_rule_definition ADD PRIMARY KEY (id)"
  end
end
