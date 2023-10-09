# frozen_string_literal: true

# Migration responsible for adding foreign keys to the field_answer table
class AddForeignKeysToFieldAnswer < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :field_answer, :field, column: :field_id, primary_key: :field_id
    add_foreign_key :field_answer, :concept, column: :answer_id, primary_key: :concept_id
    add_foreign_key :field_answer, :users, column: :creator, primary_key: :user_id
  end
end
