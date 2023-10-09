# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the patient_state table
class AddPrimaryKeysAndIndexesToPatientState < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE patient_state ADD PRIMARY KEY (patient_state_id)"
  end
end
