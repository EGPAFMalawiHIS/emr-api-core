# frozen_string_literal: true

# Migration responsible for adding foreign keys to the concept_set table
class AddForeignKeysToConceptSet < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :concept_set, :concept, column: :concept_set, primary_key: :concept_id
    add_foreign_key :concept_set, :concept, column: :concept_id, primary_key: :concept_id
    add_foreign_key :concept_set, :users, column: :creator, primary_key: :user_id
  end
end
