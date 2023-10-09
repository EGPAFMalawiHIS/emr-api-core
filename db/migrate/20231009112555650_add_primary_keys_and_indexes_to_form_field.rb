# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the form_field table
class AddPrimaryKeysAndIndexesToFormField < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE form_field ADD PRIMARY KEY (form_field_id)"
  end
end
