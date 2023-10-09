# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the patient_program_attribute table
class AddPrimaryKeysAndIndexesToPatientProgramAttribute < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE patient_program_attribute ADD PRIMARY KEY (patient_program_attribute_id)"
  end
end
