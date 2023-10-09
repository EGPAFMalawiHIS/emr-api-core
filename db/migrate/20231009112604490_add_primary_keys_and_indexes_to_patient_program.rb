# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the patient_program table
class AddPrimaryKeysAndIndexesToPatientProgram < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE patient_program ADD PRIMARY KEY (patient_program_id)"
  end
end
