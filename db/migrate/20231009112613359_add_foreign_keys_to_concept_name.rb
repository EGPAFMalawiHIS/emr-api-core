# frozen_string_literal: true

# Migration responsible for adding foreign keys to the concept_name table
class AddForeignKeysToConceptName < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :concept_name, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :concept_name, :concept, column: :concept_id, primary_key: :concept_id
    add_foreign_key :concept_name, :users, column: :creator, primary_key: :user_id
    add_foreign_key :concept_name, :users, column: :voided_by, primary_key: :user_id
  end
end
