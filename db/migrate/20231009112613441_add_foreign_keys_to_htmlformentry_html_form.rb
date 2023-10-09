# frozen_string_literal: true

# Migration responsible for adding foreign keys to the htmlformentry_html_form table
class AddForeignKeysToHtmlformentryHtmlForm < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :htmlformentry_html_form, :form, column: :form_id, primary_key: :form_id
    add_foreign_key :htmlformentry_html_form, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :htmlformentry_html_form, :users, column: :creator, primary_key: :user_id
    add_foreign_key :htmlformentry_html_form, :users, column: :retired_by, primary_key: :user_id
  end
end
