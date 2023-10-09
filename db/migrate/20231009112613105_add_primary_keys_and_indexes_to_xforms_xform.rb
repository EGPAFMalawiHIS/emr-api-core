# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the xforms_xform table
class AddPrimaryKeysAndIndexesToXformsXform < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE xforms_xform ADD PRIMARY KEY (form_id)"
  end
end
