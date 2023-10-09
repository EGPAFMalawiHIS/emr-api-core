# frozen_string_literal: true

# Migration responsible for adding foreign keys to the form_field table
class AddForeignKeysToFormField < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :form_field, :field, column: :field_id, primary_key: :field_id
    add_foreign_key :form_field, :form, column: :form_id, primary_key: :form_id
    add_foreign_key :form_field, :form_field, column: :parent_form_field, primary_key: :form_field_id
    add_foreign_key :form_field, :users, column: :creator, primary_key: :user_id
    add_foreign_key :form_field, :users, column: :changed_by, primary_key: :user_id
  end
end
