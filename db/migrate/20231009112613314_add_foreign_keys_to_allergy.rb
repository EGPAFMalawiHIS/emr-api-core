# frozen_string_literal: true

# Migration responsible for adding foreign keys to the allergy table
class AddForeignKeysToAllergy < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :allergy, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :allergy, :concept, column: :coded_allergen, primary_key: :concept_id
    add_foreign_key :allergy, :users, column: :creator, primary_key: :user_id
    add_foreign_key :allergy, :patient, column: :patient_id, primary_key: :patient_id
    add_foreign_key :allergy, :concept, column: :severity_concept_id, primary_key: :concept_id
    add_foreign_key :allergy, :users, column: :voided_by, primary_key: :user_id
  end
end
