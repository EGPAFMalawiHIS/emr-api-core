# frozen_string_literal: true

# Migration responsible for adding foreign keys to the patient table
class AddForeignKeysToPatient < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :patient, :person, column: :patient_id, primary_key: :person_id
    add_foreign_key :patient, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :patient, :users, column: :creator, primary_key: :user_id
    add_foreign_key :patient, :users, column: :voided_by, primary_key: :user_id
  end
end
