# frozen_string_literal: true

# Migration responsible for adding foreign keys to the hl7_source table
class AddForeignKeysToHl7Source < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :hl7_source, :users, column: :creator, primary_key: :user_id
  end
end
