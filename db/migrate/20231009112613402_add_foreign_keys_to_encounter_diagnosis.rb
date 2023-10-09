# frozen_string_literal: true

# Migration responsible for adding foreign keys to the encounter_diagnosis table
class AddForeignKeysToEncounterDiagnosis < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :encounter_diagnosis, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :encounter_diagnosis, :concept, column: :diagnosis_coded, primary_key: :concept_id
    add_foreign_key :encounter_diagnosis, :concept_name, column: :diagnosis_coded_name, primary_key: :concept_name_id
    add_foreign_key :encounter_diagnosis, :conditions, column: :condition_id, primary_key: :condition_id
    add_foreign_key :encounter_diagnosis, :users, column: :creator, primary_key: :user_id
    add_foreign_key :encounter_diagnosis, :encounter, column: :encounter_id, primary_key: :encounter_id
    add_foreign_key :encounter_diagnosis, :patient, column: :patient_id, primary_key: :patient_id
    add_foreign_key :encounter_diagnosis, :users, column: :voided_by, primary_key: :user_id
  end
end
