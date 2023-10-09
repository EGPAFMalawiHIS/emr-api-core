# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the liquibasechangeloglock table
class AddPrimaryKeysAndIndexesToLiquibasechangeloglock < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE liquibasechangeloglock ADD PRIMARY KEY (ID)"
  end
end
