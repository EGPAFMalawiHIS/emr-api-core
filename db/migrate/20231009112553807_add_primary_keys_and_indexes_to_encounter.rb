# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the encounter table
class AddPrimaryKeysAndIndexesToEncounter < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE encounter ADD PRIMARY KEY (encounter_id)"
  end
end
