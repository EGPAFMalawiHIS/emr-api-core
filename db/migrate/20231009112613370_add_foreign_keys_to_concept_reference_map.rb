# frozen_string_literal: true

# Migration responsible for adding foreign keys to the concept_reference_map table
class AddForeignKeysToConceptReferenceMap < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :concept_reference_map, :concept_map_type, column: :concept_map_type_id, primary_key: :concept_map_type_id
    add_foreign_key :concept_reference_map, :concept_reference_term, column: :concept_reference_term_id, primary_key: :concept_reference_term_id
    add_foreign_key :concept_reference_map, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :concept_reference_map, :users, column: :creator, primary_key: :user_id
    add_foreign_key :concept_reference_map, :concept, column: :concept_id, primary_key: :concept_id
  end
end
