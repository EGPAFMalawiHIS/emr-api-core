# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the patient_identifier table
class AddPrimaryKeysAndIndexesToPatientIdentifier < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE patient_identifier ADD PRIMARY KEY (patient_identifier_id)"
  end
end
