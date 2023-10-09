# frozen_string_literal: true

# Migration responsible for adding foreign keys to the formentry_error table
class AddForeignKeysToFormentryError < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :formentry_error, :users, column: :creator, primary_key: :user_id
  end
end
