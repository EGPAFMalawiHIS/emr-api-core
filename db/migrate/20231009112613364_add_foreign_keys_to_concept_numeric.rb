# frozen_string_literal: true

# Migration responsible for adding foreign keys to the concept_numeric table
class AddForeignKeysToConceptNumeric < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :concept_numeric, :concept, column: :concept_id, primary_key: :concept_id
  end
end
