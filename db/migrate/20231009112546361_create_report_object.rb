# frozen_string_literal: true

# Migration responsible for creating the report_object table
class CreateReportObject < ActiveRecord::Migration[6.0]
  def change
    create_table :report_object, id: false do |t|
      t.bigint :report_object_id, null: false, limit: 4
      t.string :name, null: false, limit: 255
      t.string :description, limit: 1000
      t.string :report_object_type, null: false, limit: 255
      t.string :report_object_sub_type, null: false, limit: 255
      t.text :xml_data, limit: 65535
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.boolean :voided, null: false, default: '0'
      t.bigint :voided_by, limit: 4
      t.datetime :date_voided
      t.string :void_reason, limit: 255
      t.string :uuid, null: false, limit: 38
    end
  end
end
