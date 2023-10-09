# frozen_string_literal: true

# Migration responsible for creating the relationship table
class CreateRelationship < ActiveRecord::Migration[6.0]
  def change
    create_table :relationship, id: false do |t|
      t.bigint :relationship_id, null: false, limit: 4
      t.bigint :person_a, null: false, limit: 4
      t.bigint :relationship, null: false, default: '0', limit: 4
      t.bigint :person_b, null: false, limit: 4
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.boolean :voided, null: false, default: '0'
      t.bigint :voided_by, limit: 4
      t.datetime :date_voided
      t.string :void_reason, limit: 255
      t.string :uuid, null: false, limit: 38
      t.datetime :date_changed
      t.bigint :changed_by, limit: 4
      t.datetime :start_date
      t.datetime :end_date
    end
  end
end
