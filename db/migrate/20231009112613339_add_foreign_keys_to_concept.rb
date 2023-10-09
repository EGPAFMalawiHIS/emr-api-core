# frozen_string_literal: true

# Migration responsible for adding foreign keys to the concept table
class AddForeignKeysToConcept < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :concept, :concept_class, column: :class_id, primary_key: :concept_class_id
    add_foreign_key :concept, :users, column: :creator, primary_key: :user_id
    add_foreign_key :concept, :concept_datatype, column: :datatype_id, primary_key: :concept_datatype_id
    add_foreign_key :concept, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :concept, :users, column: :retired_by, primary_key: :user_id
  end
end
