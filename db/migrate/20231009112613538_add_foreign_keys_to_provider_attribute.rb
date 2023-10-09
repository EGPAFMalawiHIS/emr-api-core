# frozen_string_literal: true

# Migration responsible for adding foreign keys to the provider_attribute table
class AddForeignKeysToProviderAttribute < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :provider_attribute, :provider_attribute_type, column: :attribute_type_id, primary_key: :provider_attribute_type_id
    add_foreign_key :provider_attribute, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :provider_attribute, :users, column: :creator, primary_key: :user_id
    add_foreign_key :provider_attribute, :provider, column: :provider_id, primary_key: :provider_id
    add_foreign_key :provider_attribute, :users, column: :voided_by, primary_key: :user_id
  end
end
