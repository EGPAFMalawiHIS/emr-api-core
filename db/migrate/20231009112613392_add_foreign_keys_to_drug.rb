# frozen_string_literal: true

# Migration responsible for adding foreign keys to the drug table
class AddForeignKeysToDrug < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :drug, :concept, column: :dosage_form, primary_key: :concept_id
    add_foreign_key :drug, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :drug, :users, column: :creator, primary_key: :user_id
    add_foreign_key :drug, :users, column: :retired_by, primary_key: :user_id
    add_foreign_key :drug, :concept, column: :concept_id, primary_key: :concept_id
    add_foreign_key :drug, :concept, column: :route, primary_key: :concept_id
  end
end
