# frozen_string_literal: true

# Migration responsible for creating the liquibasechangeloglock table
class CreateLiquibasechangeloglock < ActiveRecord::Migration[6.0]
  def change
    create_table :liquibasechangeloglock, id: false do |t|
      t.bigint :ID, null: false, limit: 4
      t.boolean :LOCKED, null: false
      t.datetime :LOCKGRANTED
      t.string :LOCKEDBY, limit: 255
    end
  end
end
