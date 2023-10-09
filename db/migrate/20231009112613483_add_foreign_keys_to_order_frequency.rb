# frozen_string_literal: true

# Migration responsible for adding foreign keys to the order_frequency table
class AddForeignKeysToOrderFrequency < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :order_frequency, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :order_frequency, :concept, column: :concept_id, primary_key: :concept_id
    add_foreign_key :order_frequency, :users, column: :creator, primary_key: :user_id
    add_foreign_key :order_frequency, :users, column: :retired_by, primary_key: :user_id
  end
end
