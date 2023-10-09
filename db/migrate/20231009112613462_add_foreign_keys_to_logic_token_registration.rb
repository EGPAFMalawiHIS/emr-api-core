# frozen_string_literal: true

# Migration responsible for adding foreign keys to the logic_token_registration table
class AddForeignKeysToLogicTokenRegistration < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :logic_token_registration, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :logic_token_registration, :users, column: :creator, primary_key: :user_id
  end
end
