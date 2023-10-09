# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the form table
class AddPrimaryKeysAndIndexesToForm < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE form ADD PRIMARY KEY (form_id)"
  end
end
