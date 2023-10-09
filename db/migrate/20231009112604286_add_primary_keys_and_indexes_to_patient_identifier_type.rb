# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the patient_identifier_type table
class AddPrimaryKeysAndIndexesToPatientIdentifierType < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE patient_identifier_type ADD PRIMARY KEY (patient_identifier_type_id)"
  end
end
