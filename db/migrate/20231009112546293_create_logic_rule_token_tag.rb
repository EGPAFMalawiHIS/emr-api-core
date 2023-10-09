# frozen_string_literal: true

# Migration responsible for creating the logic_rule_token_tag table
class CreateLogicRuleTokenTag < ActiveRecord::Migration[6.0]
  def change
    create_table :logic_rule_token_tag, id: false do |t|
      t.bigint :logic_rule_token_id, null: false, limit: 4
      t.string :tag, null: false, limit: 512
    end
  end
end
