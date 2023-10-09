# frozen_string_literal: true

# Migration responsible for adding foreign keys to the patient_program_attribute table
class AddForeignKeysToPatientProgramAttribute < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :patient_program_attribute, :program_attribute_type, column: :attribute_type_id, primary_key: :program_attribute_type_id
    add_foreign_key :patient_program_attribute, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :patient_program_attribute, :users, column: :creator, primary_key: :user_id
    add_foreign_key :patient_program_attribute, :patient_program, column: :patient_program_id, primary_key: :patient_program_id
    add_foreign_key :patient_program_attribute, :users, column: :voided_by, primary_key: :user_id
  end
end
