# frozen_string_literal: true

# Migration responsible for adding foreign keys to the patient_identifier table
class AddForeignKeysToPatientIdentifier < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :patient_identifier, :patient_identifier_type, column: :identifier_type, primary_key: :patient_identifier_type_id
    add_foreign_key :patient_identifier, :patient, column: :patient_id, primary_key: :patient_id
    add_foreign_key :patient_identifier, :users, column: :creator, primary_key: :user_id
    add_foreign_key :patient_identifier, :users, column: :voided_by, primary_key: :user_id
    add_foreign_key :patient_identifier, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :patient_identifier, :location, column: :location_id, primary_key: :location_id
  end
end
