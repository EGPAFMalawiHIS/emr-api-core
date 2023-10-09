# frozen_string_literal: true

# Migration responsible for adding foreign keys to the form_resource table
class AddForeignKeysToFormResource < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :form_resource, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :form_resource, :form, column: :form_id, primary_key: :form_id
  end
end
