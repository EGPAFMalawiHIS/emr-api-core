# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the program table
class AddPrimaryKeysAndIndexesToProgram < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE program ADD PRIMARY KEY (program_id)"
  end
end
