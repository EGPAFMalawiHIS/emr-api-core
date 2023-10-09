# frozen_string_literal: true

# Migration responsible for adding foreign keys to the cohort_member table
class AddForeignKeysToCohortMember < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :cohort_member, :users, column: :creator, primary_key: :user_id
    add_foreign_key :cohort_member, :patient, column: :patient_id, primary_key: :patient_id
    add_foreign_key :cohort_member, :cohort, column: :cohort_id, primary_key: :cohort_id
  end
end
