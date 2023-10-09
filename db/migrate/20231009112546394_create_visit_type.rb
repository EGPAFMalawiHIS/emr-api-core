# frozen_string_literal: true

# Migration responsible for creating the visit_type table
class CreateVisitType < ActiveRecord::Migration[6.0]
  def change
    create_table :visit_type, id: false do |t|
      t.bigint :visit_type_id, null: false, limit: 4
      t.string :name, null: false, limit: 255
      t.string :description, limit: 1024
      t.string :uuid, null: false, limit: 38
      t.bigint :creator, null: false, limit: 4
      t.datetime :date_created, null: false
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.bigint :retired, null: false, default: '0', limit: 1
      t.bigint :retired_by, limit: 4
      t.datetime :date_retired
      t.string :retire_reason, limit: 255
    end
  end
end
