# frozen_string_literal: true

# Migration responsible for creating the logic_token_registration_tag table
class CreateLogicTokenRegistrationTag < ActiveRecord::Migration[6.0]
  def change
    create_table :logic_token_registration_tag, id: false do |t|
      t.bigint :token_registration_id, null: false, limit: 4
      t.string :tag, null: false, limit: 512
    end
  end
end
