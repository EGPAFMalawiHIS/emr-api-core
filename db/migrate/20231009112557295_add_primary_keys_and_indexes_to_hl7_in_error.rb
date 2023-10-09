# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the hl7_in_error table
class AddPrimaryKeysAndIndexesToHl7InError < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE hl7_in_error ADD PRIMARY KEY (hl7_in_error_id)"
  end
end
