# frozen_string_literal: true

# Migration responsible for adding foreign keys to the xforms_xform table
class AddForeignKeysToXformsXform < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :xforms_xform, :users, column: :creator, primary_key: :user_id
    add_foreign_key :xforms_xform, :users, column: :changed_by, primary_key: :user_id
  end
end
