# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the reporting_report_request table
class AddPrimaryKeysAndIndexesToReportingReportRequest < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE reporting_report_request ADD PRIMARY KEY (id)"
  end
end
