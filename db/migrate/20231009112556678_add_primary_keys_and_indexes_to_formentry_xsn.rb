# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the formentry_xsn table
class AddPrimaryKeysAndIndexesToFormentryXsn < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE formentry_xsn ADD PRIMARY KEY (formentry_xsn_id)"
  end
end
