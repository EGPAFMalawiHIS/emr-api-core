# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the report_schema_xml table
class AddPrimaryKeysAndIndexesToReportSchemaXml < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE report_schema_xml ADD PRIMARY KEY (report_schema_id)"
  end
end
