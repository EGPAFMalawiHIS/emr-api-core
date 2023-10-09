# frozen_string_literal: true

# Migration responsible for adding foreign keys to the concept_reference_source table
class AddForeignKeysToConceptReferenceSource < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :concept_reference_source, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :concept_reference_source, :users, column: :creator, primary_key: :user_id
    add_foreign_key :concept_reference_source, :users, column: :retired_by, primary_key: :user_id
  end
end
