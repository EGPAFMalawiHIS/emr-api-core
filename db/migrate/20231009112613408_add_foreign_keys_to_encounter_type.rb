# frozen_string_literal: true

# Migration responsible for adding foreign keys to the encounter_type table
class AddForeignKeysToEncounterType < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :encounter_type, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :encounter_type, :privilege, column: :edit_privilege, primary_key: :privilege
    add_foreign_key :encounter_type, :privilege, column: :view_privilege, primary_key: :privilege
    add_foreign_key :encounter_type, :users, column: :creator, primary_key: :user_id
    add_foreign_key :encounter_type, :users, column: :retired_by, primary_key: :user_id
  end
end
