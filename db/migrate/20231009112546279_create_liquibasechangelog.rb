# frozen_string_literal: true

# Migration responsible for creating the liquibasechangelog table
class CreateLiquibasechangelog < ActiveRecord::Migration[6.0]
  def change
    create_table :liquibasechangelog, id: false do |t|
      t.string :ID, null: false, limit: 63
      t.string :AUTHOR, null: false, limit: 63
      t.string :FILENAME, null: false, limit: 200
      t.datetime :DATEEXECUTED, null: false
      t.string :MD5SUM, limit: 35
      t.string :DESCRIPTION, limit: 255
      t.string :COMMENTS, limit: 255
      t.string :TAG, limit: 255
      t.string :LIQUIBASE, limit: 20
      t.bigint :ORDEREXECUTED, null: false, limit: 4
      t.string :EXECTYPE, null: false, limit: 10
    end
  end
end
