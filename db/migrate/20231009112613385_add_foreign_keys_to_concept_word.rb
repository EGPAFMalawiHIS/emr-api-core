# frozen_string_literal: true

# Migration responsible for adding foreign keys to the concept_word table
class AddForeignKeysToConceptWord < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :concept_word, :concept, column: :concept_id, primary_key: :concept_id
    add_foreign_key :concept_word, :concept_name, column: :concept_name_id, primary_key: :concept_name_id
  end
end
