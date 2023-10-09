# frozen_string_literal: true

# Migration responsible for creating the person_attribute table
class CreatePersonAttribute < ActiveRecord::Migration[6.0]
  def change
    create_table :person_attribute, id: false do |t|
      t.bigint :person_attribute_id, null: false, limit: 4
      t.bigint :person_id, null: false, default: '0', limit: 4
      t.string :value, null: false, default: '', limit: 50
      t.bigint :person_attribute_type_id, null: false, default: '0', limit: 4
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.boolean :voided, null: false, default: '0'
      t.bigint :voided_by, limit: 4
      t.datetime :date_voided
      t.string :void_reason, limit: 255
      t.string :uuid, null: false, limit: 38
    end
  end
end
