# frozen_string_literal: true

# Migration responsible for creating the person_name table
class CreatePersonName < ActiveRecord::Migration[6.0]
  def change
    create_table :person_name, id: false do |t|
      t.bigint :person_name_id, null: false, limit: 4
      t.boolean :preferred, null: false, default: '0'
      t.bigint :person_id, null: false, limit: 4
      t.string :prefix, limit: 50
      t.string :given_name, limit: 50
      t.string :middle_name, limit: 50
      t.string :family_name_prefix, limit: 50
      t.string :family_name, limit: 50
      t.string :family_name2, limit: 50
      t.string :family_name_suffix, limit: 50
      t.string :degree, limit: 50
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.boolean :voided, null: false, default: '0'
      t.bigint :voided_by, limit: 4
      t.datetime :date_voided
      t.string :void_reason, limit: 255
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.string :uuid, null: false, limit: 38
    end
  end
end
