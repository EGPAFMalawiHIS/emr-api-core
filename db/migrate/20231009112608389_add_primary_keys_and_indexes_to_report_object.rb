# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the report_object table
class AddPrimaryKeysAndIndexesToReportObject < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE report_object ADD PRIMARY KEY (report_object_id)"
  end
end
