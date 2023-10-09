# frozen_string_literal: true

# Migration responsible for adding foreign keys to the concept_description table
class AddForeignKeysToConceptDescription < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :concept_description, :concept, column: :concept_id, primary_key: :concept_id
    add_foreign_key :concept_description, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :concept_description, :users, column: :creator, primary_key: :user_id
  end
end
