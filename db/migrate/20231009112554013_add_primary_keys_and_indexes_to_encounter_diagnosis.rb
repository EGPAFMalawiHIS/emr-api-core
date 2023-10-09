# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the encounter_diagnosis table
class AddPrimaryKeysAndIndexesToEncounterDiagnosis < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE encounter_diagnosis ADD PRIMARY KEY (diagnosis_id)"
  end
end
