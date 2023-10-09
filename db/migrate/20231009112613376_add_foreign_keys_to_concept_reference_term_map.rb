# frozen_string_literal: true

# Migration responsible for adding foreign keys to the concept_reference_term_map table
class AddForeignKeysToConceptReferenceTermMap < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :concept_reference_term_map, :concept_map_type, column: :a_is_to_b_id, primary_key: :concept_map_type_id
    add_foreign_key :concept_reference_term_map, :concept_reference_term, column: :term_a_id, primary_key: :concept_reference_term_id
    add_foreign_key :concept_reference_term_map, :concept_reference_term, column: :term_b_id, primary_key: :concept_reference_term_id
    add_foreign_key :concept_reference_term_map, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :concept_reference_term_map, :users, column: :creator, primary_key: :user_id
  end
end
