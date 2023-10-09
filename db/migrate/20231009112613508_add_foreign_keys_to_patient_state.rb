# frozen_string_literal: true

# Migration responsible for adding foreign keys to the patient_state table
class AddForeignKeysToPatientState < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :patient_state, :patient_program, column: :patient_program_id, primary_key: :patient_program_id
    add_foreign_key :patient_state, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :patient_state, :users, column: :creator, primary_key: :user_id
    add_foreign_key :patient_state, :users, column: :voided_by, primary_key: :user_id
    add_foreign_key :patient_state, :program_workflow_state, column: :state, primary_key: :program_workflow_state_id
  end
end
