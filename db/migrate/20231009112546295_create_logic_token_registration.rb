# frozen_string_literal: true

# Migration responsible for creating the logic_token_registration table
class CreateLogicTokenRegistration < ActiveRecord::Migration[6.0]
  def change
    create_table :logic_token_registration, id: false do |t|
      t.bigint :token_registration_id, null: false, limit: 4
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.string :token, null: false, limit: 512
      t.string :provider_class_name, null: false, limit: 512
      t.string :provider_token, null: false, limit: 512
      t.string :configuration, limit: 2000
      t.string :uuid, null: false, limit: 38
    end
  end
end
