# frozen_string_literal: true

# Migration responsible for creating the relationship_type table
class CreateRelationshipType < ActiveRecord::Migration[6.0]
  def change
    create_table :relationship_type, id: false do |t|
      t.bigint :relationship_type_id, null: false, limit: 4
      t.string :a_is_to_b, null: false, limit: 50
      t.string :b_is_to_a, null: false, limit: 50
      t.bigint :preferred, null: false, default: '0', limit: 4
      t.bigint :weight, null: false, default: '0', limit: 4
      t.string :description, limit: 255
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.string :uuid, null: false, limit: 38
      t.boolean :retired, null: false, default: '0'
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retire_reason, limit: 255
      t.datetime :date_changed
      t.bigint :changed_by, limit: 4
    end
  end
end
