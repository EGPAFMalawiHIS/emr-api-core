# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the hl7_in_queue table
class AddPrimaryKeysAndIndexesToHl7InQueue < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE hl7_in_queue ADD PRIMARY KEY (hl7_in_queue_id)"
  end
end
