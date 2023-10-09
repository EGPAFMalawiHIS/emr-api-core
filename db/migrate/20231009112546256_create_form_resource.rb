# frozen_string_literal: true

# Migration responsible for creating the form_resource table
class CreateFormResource < ActiveRecord::Migration[6.0]
  def change
    create_table :form_resource, id: false do |t|
      t.bigint :form_resource_id, null: false, limit: 4
      t.bigint :form_id, null: false, limit: 4
      t.string :name, null: false, limit: 255
      t.text :value_reference, null: false, limit: 65535
      t.string :datatype, limit: 255
      t.text :datatype_config, limit: 65535
      t.string :preferred_handler, limit: 255
      t.text :handler_config, limit: 65535
      t.string :uuid, null: false, limit: 38
      t.datetime :date_changed
      t.bigint :changed_by, limit: 4
    end
  end
end
