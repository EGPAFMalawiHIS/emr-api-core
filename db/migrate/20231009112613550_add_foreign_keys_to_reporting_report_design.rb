# frozen_string_literal: true

# Migration responsible for adding foreign keys to the reporting_report_design table
class AddForeignKeysToReportingReportDesign < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :reporting_report_design, :users, column: :changed_by, primary_key: :user_id
    add_foreign_key :reporting_report_design, :users, column: :creator, primary_key: :user_id
    add_foreign_key :reporting_report_design, :serialized_object, column: :report_definition_id, primary_key: :serialized_object_id
    add_foreign_key :reporting_report_design, :users, column: :retired_by, primary_key: :user_id
  end
end
