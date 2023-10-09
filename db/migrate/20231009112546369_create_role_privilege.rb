# frozen_string_literal: true

# Migration responsible for creating the role_privilege table
class CreateRolePrivilege < ActiveRecord::Migration[6.0]
  def change
    create_table :role_privilege, id: false do |t|
      t.string :role, null: false, default: '', limit: 50
      t.string :privilege, null: false, limit: 255
    end
  end
end
