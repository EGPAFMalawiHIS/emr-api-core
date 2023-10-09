# frozen_string_literal: true

# Migration responsible for creating the user_property table
class CreateUserProperty < ActiveRecord::Migration[6.0]
  def change
    create_table :user_property, id: false do |t|
      t.bigint :user_id, null: false, default: '0', limit: 4
      t.string :property, null: false, default: '', limit: 100
      t.string :property_value, null: false, default: '', limit: 255
    end
  end
end
