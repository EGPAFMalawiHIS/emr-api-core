# frozen_string_literal: true

# Migration responsible for adding foreign keys to the formentry_xsn table
class AddForeignKeysToFormentryXsn < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :formentry_xsn, :form, column: :form_id, primary_key: :form_id
    add_foreign_key :formentry_xsn, :users, column: :archived_by, primary_key: :user_id
    add_foreign_key :formentry_xsn, :users, column: :creator, primary_key: :user_id
  end
end
