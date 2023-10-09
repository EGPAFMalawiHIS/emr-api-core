# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the encounter_role table
class AddPrimaryKeysAndIndexesToEncounterRole < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE encounter_role ADD PRIMARY KEY (encounter_role_id)"
  end
end
