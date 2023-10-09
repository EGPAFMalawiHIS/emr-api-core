# frozen_string_literal: true

# Migration responsible for adding foreign keys to the logic_rule_token table
class AddForeignKeysToLogicRuleToken < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :logic_rule_token, :person, column: :changed_by, primary_key: :person_id
    add_foreign_key :logic_rule_token, :person, column: :creator, primary_key: :person_id
  end
end
