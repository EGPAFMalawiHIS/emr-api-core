# frozen_string_literal: true

# Migration responsible for adding foreign keys to the visit_attribute table
class AddForeignKeysToVisitAttribute < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :visit_attribute, :visit_attribute_type, column: :attribute_type_id, primary_key: :visit_attribute_type_id
    add_foreign_key :visit_attribute, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :visit_attribute, :users, column: :creator, primary_key: :user_id
    add_foreign_key :visit_attribute, :visit, column: :visit_id, primary_key: :visit_id
    add_foreign_key :visit_attribute, :users, column: :voided_by, primary_key: :user_id
  end
end
