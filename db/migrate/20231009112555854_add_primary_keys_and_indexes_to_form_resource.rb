# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the form_resource table
class AddPrimaryKeysAndIndexesToFormResource < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE form_resource ADD PRIMARY KEY (form_resource_id)"
  end
end
