# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the dataintegrity_integrity_checks table
class AddPrimaryKeysAndIndexesToDataintegrityIntegrityChecks < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE dataintegrity_integrity_checks ADD PRIMARY KEY (dataintegrity_integrity_check_id)"
  end
end
