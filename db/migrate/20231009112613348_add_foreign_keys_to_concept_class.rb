# frozen_string_literal: true

# Migration responsible for adding foreign keys to the concept_class table
class AddForeignKeysToConceptClass < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :concept_class, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :concept_class, :users, column: :creator, primary_key: :user_id
    add_foreign_key :concept_class, :users, column: :retired_by, primary_key: :user_id
  end
end
