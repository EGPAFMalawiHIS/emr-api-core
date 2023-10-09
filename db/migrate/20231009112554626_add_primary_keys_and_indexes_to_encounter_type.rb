# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the encounter_type table
class AddPrimaryKeysAndIndexesToEncounterType < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE encounter_type ADD PRIMARY KEY (encounter_type_id)"
  end
end
