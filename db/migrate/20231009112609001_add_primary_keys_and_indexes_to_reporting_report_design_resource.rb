# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the reporting_report_design_resource table
class AddPrimaryKeysAndIndexesToReportingReportDesignResource < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE reporting_report_design_resource ADD PRIMARY KEY (id)"
  end
end
