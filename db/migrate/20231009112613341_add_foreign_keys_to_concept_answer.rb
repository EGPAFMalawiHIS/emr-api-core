# frozen_string_literal: true

# Migration responsible for adding foreign keys to the concept_answer table
class AddForeignKeysToConceptAnswer < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :concept_answer, :concept, column: :answer_concept, primary_key: :concept_id
    add_foreign_key :concept_answer, :concept, column: :concept_id, primary_key: :concept_id
    add_foreign_key :concept_answer, :drug, column: :answer_drug, primary_key: :drug_id
    add_foreign_key :concept_answer, :users, column: :creator, primary_key: :user_id
  end
end
