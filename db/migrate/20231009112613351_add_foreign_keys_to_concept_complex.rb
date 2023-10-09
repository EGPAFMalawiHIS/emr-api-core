# frozen_string_literal: true

# Migration responsible for adding foreign keys to the concept_complex table
class AddForeignKeysToConceptComplex < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :concept_complex, :concept, column: :concept_id, primary_key: :concept_id
  end
end
