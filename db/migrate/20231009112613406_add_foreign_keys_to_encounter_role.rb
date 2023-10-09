# frozen_string_literal: true

# Migration responsible for adding foreign keys to the encounter_role table
class AddForeignKeysToEncounterRole < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :encounter_role, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :encounter_role, :users, column: :creator, primary_key: :user_id
    add_foreign_key :encounter_role, :users, column: :retired_by, primary_key: :user_id
  end
end
