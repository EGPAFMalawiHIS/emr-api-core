# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the formentry_error table
class AddPrimaryKeysAndIndexesToFormentryError < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE formentry_error ADD PRIMARY KEY (formentry_error_id)"
  end
end
