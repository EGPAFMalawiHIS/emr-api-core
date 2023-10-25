# frozen_string_literal: true

# Migration responsible for adding foreign keys to the reporting_report_design_resource table
class AddForeignKeysToReportingReportDesignResource < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :reporting_report_design_resource, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :reporting_report_design_resource, :users, column: :creator, primary_key: :user_id
    add_foreign_key :reporting_report_design_resource, :reporting_report_design, column: :report_design_id
    add_foreign_key :reporting_report_design_resource, :users, column: :retired_by, primary_key: :user_id
  end
end