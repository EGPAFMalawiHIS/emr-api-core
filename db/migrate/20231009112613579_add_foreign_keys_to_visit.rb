# frozen_string_literal: true

# Migration responsible for adding foreign keys to the visit table
class AddForeignKeysToVisit < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :visit, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :visit, :users, column: :creator, primary_key: :user_id
    add_foreign_key :visit, :concept, column: :indication_concept_id, primary_key: :concept_id
    add_foreign_key :visit, :location, column: :location_id, primary_key: :location_id
    add_foreign_key :visit, :patient, column: :patient_id, primary_key: :patient_id
    add_foreign_key :visit, :visit_type, column: :visit_type_id, primary_key: :visit_type_id
    add_foreign_key :visit, :users, column: :voided_by, primary_key: :user_id
  end
end
