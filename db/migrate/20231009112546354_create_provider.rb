# frozen_string_literal: true

# Migration responsible for creating the provider table
class CreateProvider < ActiveRecord::Migration[6.0]
  def change
    create_table :provider, id: false do |t|
      t.bigint :provider_id, null: false, limit: 4
      t.bigint :person_id, limit: 4
      t.string :name, limit: 255
      t.string :identifier, limit: 255
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.boolean :retired, null: false, default: '0'
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retire_reason, limit: 255
      t.string :uuid, null: false, limit: 38
      t.bigint :role_id, limit: 4
      t.bigint :speciality_id, limit: 4
    end
  end
end
