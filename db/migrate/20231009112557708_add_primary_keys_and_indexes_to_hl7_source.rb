# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the hl7_source table
class AddPrimaryKeysAndIndexesToHl7Source < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE hl7_source ADD PRIMARY KEY (hl7_source_id)"
  end
end
