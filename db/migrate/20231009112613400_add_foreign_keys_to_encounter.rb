# frozen_string_literal: true

# Migration responsible for adding foreign keys to the encounter table
class AddForeignKeysToEncounter < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :encounter, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :encounter, :form, column: :form_id, primary_key: :form_id
    add_foreign_key :encounter, :users, column: :creator, primary_key: :user_id
    add_foreign_key :encounter, :location, column: :location_id, primary_key: :location_id
    add_foreign_key :encounter, :patient, column: :patient_id, primary_key: :patient_id
    add_foreign_key :encounter, :encounter_type, column: :encounter_type, primary_key: :encounter_type_id
    add_foreign_key :encounter, :visit, column: :visit_id, primary_key: :visit_id
    add_foreign_key :encounter, :users, column: :voided_by, primary_key: :user_id
  end
end
