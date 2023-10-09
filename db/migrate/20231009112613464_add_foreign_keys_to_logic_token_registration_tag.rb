# frozen_string_literal: true

# Migration responsible for adding foreign keys to the logic_token_registration_tag table
class AddForeignKeysToLogicTokenRegistrationTag < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :logic_token_registration_tag, :logic_token_registration, column: :token_registration_id, primary_key: :token_registration_id
  end
end
