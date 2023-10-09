# frozen_string_literal: true

# Migration responsible for creating the report_schema_xml table
class CreateReportSchemaXml < ActiveRecord::Migration[6.0]
  def change
    create_table :report_schema_xml, id: false do |t|
      t.bigint :report_schema_id, null: false, limit: 4
      t.string :name, null: false, limit: 255
      t.text :description, null: false, limit: 65535
      t.text :xml_data, null: false, limit: 16777215
      t.string :uuid, null: false, limit: 38
    end
  end
end
