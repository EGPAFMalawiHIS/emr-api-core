# frozen_string_literal: true

# Migration responsible for adding foreign keys to the patient_program table
class AddForeignKeysToPatientProgram < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :patient_program, :patient, column: :patient_id, primary_key: :patient_id
    add_foreign_key :patient_program, :users, column: :creator, primary_key: :user_id
    add_foreign_key :patient_program, :location, column: :location_id, primary_key: :location_id
    add_foreign_key :patient_program, :concept, column: :outcome_concept_id, primary_key: :concept_id
    add_foreign_key :patient_program, :program, column: :program_id, primary_key: :program_id
    add_foreign_key :patient_program, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :patient_program, :users, column: :voided_by, primary_key: :user_id
  end
end
