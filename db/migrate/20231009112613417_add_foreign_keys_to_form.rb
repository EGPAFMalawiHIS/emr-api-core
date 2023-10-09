# frozen_string_literal: true

# Migration responsible for adding foreign keys to the form table
class AddForeignKeysToForm < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :form, :encounter_type, column: :encounter_type, primary_key: :encounter_type_id
    add_foreign_key :form, :users, column: :creator, primary_key: :user_id
    add_foreign_key :form, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :form, :users, column: :retired_by, primary_key: :user_id
  end
end
