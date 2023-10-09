# frozen_string_literal: true

# Migration responsible for creating the role_role table
class CreateRoleRole < ActiveRecord::Migration[6.0]
  def change
    create_table :role_role, id: false do |t|
      t.string :parent_role, null: false, default: '', limit: 50
      t.string :child_role, null: false, default: '', limit: 255
    end
  end
end
