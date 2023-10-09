# frozen_string_literal: true

# Migration responsible for adding foreign keys to the reporting_report_request table
class AddForeignKeysToReportingReportRequest < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :reporting_report_request, :users, column: :requested_by, primary_key: :user_id
  end
end
