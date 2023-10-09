# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the formentry_archive table
class AddPrimaryKeysAndIndexesToFormentryArchive < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE formentry_archive ADD PRIMARY KEY (formentry_archive_id)"
  end
end
