# frozen_string_literal: true

# Migration responsible for adding foreign keys to the program table
class AddForeignKeysToProgram < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :program, :concept, column: :concept_id, primary_key: :concept_id
    add_foreign_key :program, :users, column: :creator, primary_key: :user_id
    add_foreign_key :program, :concept, column: :outcomes_concept_id, primary_key: :concept_id
    add_foreign_key :program, :users, column: :changed_by, primary_key: :user_id
  end
end
