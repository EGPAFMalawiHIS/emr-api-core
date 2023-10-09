# frozen_string_literal: true

# Migration responsible for creating the users table
class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: false do |t|
      t.bigint :user_id, null: false, limit: 4
      t.string :system_id, null: false, default: '', limit: 50
      t.string :username, limit: 50
      t.string :password, limit: 128
      t.string :salt, limit: 128
      t.string :secret_question, limit: 255
      t.string :secret_answer, limit: 255
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.bigint :person_id, null: false, limit: 4
      t.boolean :retired, null: false, default: '0'
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retire_reason, limit: 255
      t.string :uuid, null: false, limit: 38
      t.string :activation_key, limit: 255
      t.string :email, limit: 255
    end
  end
end
