# frozen_string_literal: true

# Migration responsible for adding foreign keys to the conditions table
class AddForeignKeysToConditions < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :conditions, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :conditions, :concept, column: :condition_coded, primary_key: :concept_id
    add_foreign_key :conditions, :concept_name, column: :condition_coded_name, primary_key: :concept_name_id
    add_foreign_key :conditions, :users, column: :creator, primary_key: :user_id
    add_foreign_key :conditions, :patient, column: :patient_id, primary_key: :patient_id
    add_foreign_key :conditions, :conditions, column: :previous_version, primary_key: :condition_id
    add_foreign_key :conditions, :users, column: :voided_by, primary_key: :user_id
  end
end
