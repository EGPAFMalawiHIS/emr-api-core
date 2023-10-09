# frozen_string_literal: true

# Migration responsible for creating the logic_rule_token table
class CreateLogicRuleToken < ActiveRecord::Migration[6.0]
  def change
    create_table :logic_rule_token, id: false do |t|
      t.bigint :logic_rule_token_id, null: false, limit: 4
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.string :token, null: false, limit: 512
      t.string :class_name, null: false, limit: 512
      t.string :state, limit: 512
      t.string :uuid, null: false, limit: 38
    end
  end
end
