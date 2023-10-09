# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the liquibasechangelog table
class AddPrimaryKeysAndIndexesToLiquibasechangelog < ActiveRecord::Migration[6.0]
  def up
    add_index :liquibasechangelog, %i[ID AUTHOR FILENAME], unique: true
  end

  def down
    remove_index :liquibasechangelog, %i[ID AUTHOR FILENAME]
  end
end
