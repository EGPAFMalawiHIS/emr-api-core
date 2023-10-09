# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the patient table
class AddPrimaryKeysAndIndexesToPatient < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE patient ADD PRIMARY KEY (patient_id)"
  end
end
