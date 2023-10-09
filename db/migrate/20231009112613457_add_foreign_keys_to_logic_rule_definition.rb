# frozen_string_literal: true

# Migration responsible for adding foreign keys to the logic_rule_definition table
class AddForeignKeysToLogicRuleDefinition < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :logic_rule_definition, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :logic_rule_definition, :users, column: :creator, primary_key: :user_id
    add_foreign_key :logic_rule_definition, :users, column: :retired_by, primary_key: :user_id
  end
end
