# frozen_string_literal: true

# Migration responsible for adding foreign keys to the encounter_provider table
class AddForeignKeysToEncounterProvider < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :encounter_provider, :encounter, column: :encounter_id, primary_key: :encounter_id
    add_foreign_key :encounter_provider, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :encounter_provider, :users, column: :creator, primary_key: :user_id
    add_foreign_key :encounter_provider, :users, column: :voided_by, primary_key: :user_id
    add_foreign_key :encounter_provider, :encounter_role, column: :encounter_role_id, primary_key: :encounter_role_id
    add_foreign_key :encounter_provider, :provider, column: :provider_id, primary_key: :provider_id
  end
end
