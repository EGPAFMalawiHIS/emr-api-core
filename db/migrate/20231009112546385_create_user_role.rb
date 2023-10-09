# frozen_string_literal: true

# Migration responsible for creating the user_role table
class CreateUserRole < ActiveRecord::Migration[6.0]
  def change
    create_table :user_role, id: false do |t|
      t.bigint :user_id, null: false, default: '0', limit: 4
      t.string :role, null: false, default: '', limit: 50
    end
  end
end
