# frozen_string_literal: true

# Migration responsible for adding foreign keys to the concept_name_tag table
class AddForeignKeysToConceptNameTag < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :concept_name_tag, :users, column: :changed_by, primary_key: :user_id
  end
end
