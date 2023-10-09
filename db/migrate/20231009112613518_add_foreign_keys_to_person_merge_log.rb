# frozen_string_literal: true

# Migration responsible for adding foreign keys to the person_merge_log table
class AddForeignKeysToPersonMergeLog < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :person_merge_log, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :person_merge_log, :users, column: :creator, primary_key: :user_id
    add_foreign_key :person_merge_log, :person, column: :loser_person_id, primary_key: :person_id
    add_foreign_key :person_merge_log, :users, column: :voided_by, primary_key: :user_id
    add_foreign_key :person_merge_log, :person, column: :winner_person_id, primary_key: :person_id
  end
end
