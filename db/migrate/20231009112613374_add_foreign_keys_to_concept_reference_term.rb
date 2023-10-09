# frozen_string_literal: true

# Migration responsible for adding foreign keys to the concept_reference_term table
class AddForeignKeysToConceptReferenceTerm < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :concept_reference_term, :concept_reference_source, column: :concept_source_id, primary_key: :concept_source_id
    add_foreign_key :concept_reference_term, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :concept_reference_term, :users, column: :creator, primary_key: :user_id
    add_foreign_key :concept_reference_term, :users, column: :retired_by, primary_key: :user_id
  end
end
