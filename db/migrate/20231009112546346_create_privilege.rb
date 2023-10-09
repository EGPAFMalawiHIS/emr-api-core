# frozen_string_literal: true

# Migration responsible for creating the privilege table
class CreatePrivilege < ActiveRecord::Migration[6.0]
  def change
    create_table :privilege, id: false do |t|
      t.string :privilege, null: false, limit: 255
      t.text :description, limit: 65535
      t.string :uuid, null: false, limit: 38
    end
  end
end
