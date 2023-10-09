# frozen_string_literal: true

# Migration responsible for adding foreign keys to the field table
class AddForeignKeysToField < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :field, :concept, column: :concept_id, primary_key: :concept_id
    add_foreign_key :field, :field_type, column: :field_type, primary_key: :field_type_id
    add_foreign_key :field, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :field, :users, column: :creator, primary_key: :user_id
    add_foreign_key :field, :users, column: :retired_by, primary_key: :user_id
  end
end
