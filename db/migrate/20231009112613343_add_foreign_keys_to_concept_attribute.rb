# frozen_string_literal: true

# Migration responsible for adding foreign keys to the concept_attribute table
class AddForeignKeysToConceptAttribute < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :concept_attribute, :concept_attribute_type, column: :attribute_type_id, primary_key: :concept_attribute_type_id
    add_foreign_key :concept_attribute, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :concept_attribute, :concept, column: :concept_id, primary_key: :concept_id
    add_foreign_key :concept_attribute, :users, column: :creator, primary_key: :user_id
    add_foreign_key :concept_attribute, :users, column: :voided_by, primary_key: :user_id
  end
end
