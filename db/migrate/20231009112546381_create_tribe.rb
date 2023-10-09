# frozen_string_literal: true

# Migration responsible for creating the tribe table
class CreateTribe < ActiveRecord::Migration[6.0]
  def change
    create_table :tribe, id: false do |t|
      t.bigint :tribe_id, null: false, limit: 4
      t.boolean :retired, null: false, default: '0'
      t.string :name, null: false, default: '', limit: 50
    end
  end
end
