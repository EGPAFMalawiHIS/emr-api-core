# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the reporting_report_design table
class AddPrimaryKeysAndIndexesToReportingReportDesign < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE reporting_report_design ADD PRIMARY KEY (id)"
  end
end
