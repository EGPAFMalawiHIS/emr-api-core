# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the hl7_in_archive table
class AddPrimaryKeysAndIndexesToHl7InArchive < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE hl7_in_archive ADD PRIMARY KEY (hl7_in_archive_id)"
  end
end
