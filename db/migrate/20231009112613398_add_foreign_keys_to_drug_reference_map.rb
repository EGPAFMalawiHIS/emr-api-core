# frozen_string_literal: true

# Migration responsible for adding foreign keys to the drug_reference_map table
class AddForeignKeysToDrugReferenceMap < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :drug_reference_map, :concept_map_type, column: :concept_map_type, primary_key: :concept_map_type_id
    add_foreign_key :drug_reference_map, :concept_reference_term, column: :term_id, primary_key: :concept_reference_term_id
    add_foreign_key :drug_reference_map, :drug, column: :drug_id, primary_key: :drug_id
    add_foreign_key :drug_reference_map, :users, column: :creator, primary_key: :user_id
    add_foreign_key :drug_reference_map, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :drug_reference_map, :users, column: :retired_by, primary_key: :user_id
  end
end
