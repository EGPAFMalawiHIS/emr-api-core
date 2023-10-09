# frozen_string_literal: true

# Migration responsible for adding foreign keys to the note table
class AddForeignKeysToNote < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :note, :encounter, column: :encounter_id, primary_key: :encounter_id
    add_foreign_key :note, :note, column: :parent, primary_key: :note_id
    add_foreign_key :note, :obs, column: :obs_id, primary_key: :obs_id
    add_foreign_key :note, :patient, column: :patient_id, primary_key: :patient_id
    add_foreign_key :note, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :note, :users, column: :creator, primary_key: :user_id
  end
end
