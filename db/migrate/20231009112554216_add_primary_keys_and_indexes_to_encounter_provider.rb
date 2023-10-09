# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the encounter_provider table
class AddPrimaryKeysAndIndexesToEncounterProvider < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE encounter_provider ADD PRIMARY KEY (encounter_provider_id)"
  end
end
