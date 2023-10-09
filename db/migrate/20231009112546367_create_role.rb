# frozen_string_literal: true

# Migration responsible for creating the role table
class CreateRole < ActiveRecord::Migration[6.0]
  def change
    create_table :role, id: false do |t|
      t.string :role, null: false, default: '', limit: 50
      t.string :description, limit: 255
      t.string :uuid, null: false, limit: 38
    end
  end
end
