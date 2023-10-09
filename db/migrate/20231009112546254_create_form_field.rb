# frozen_string_literal: true

# Migration responsible for creating the form_field table
class CreateFormField < ActiveRecord::Migration[6.0]
  def change
    create_table :form_field, id: false do |t|
      t.bigint :form_field_id, null: false, limit: 4
      t.bigint :form_id, null: false, default: '0', limit: 4
      t.bigint :field_id, null: false, default: '0', limit: 4
      t.bigint :field_number, limit: 4
      t.string :field_part, limit: 5
      t.bigint :page_number, limit: 4
      t.bigint :parent_form_field, limit: 4
      t.bigint :min_occurs, limit: 4
      t.bigint :max_occurs, limit: 4
      t.boolean :required, null: false, default: '0'
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.float :sort_weight, limit: 24
      t.string :uuid, null: false, limit: 38
    end
  end
end
