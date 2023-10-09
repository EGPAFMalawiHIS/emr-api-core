# frozen_string_literal: true

# Migration responsible for adding foreign keys to the provider table
class AddForeignKeysToProvider < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :provider, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :provider, :users, column: :creator, primary_key: :user_id
    add_foreign_key :provider, :person, column: :person_id, primary_key: :person_id
    add_foreign_key :provider, :users, column: :retired_by, primary_key: :user_id
    add_foreign_key :provider, :concept, column: :role_id, primary_key: :concept_id
    add_foreign_key :provider, :concept, column: :speciality_id, primary_key: :concept_id
  end
end
