# frozen_string_literal: true

# Migration responsible for creating the global_property table
class CreateGlobalProperty < ActiveRecord::Migration[6.0]
  def change
    create_table :global_property, id: false do |t|
      t.string :property, null: false, default: '', limit: 255
      t.text :property_value, limit: 16777215
      t.text :description, limit: 65535
      t.string :uuid, null: false, limit: 38
      t.string :datatype, limit: 255
      t.text :datatype_config, limit: 65535
      t.string :preferred_handler, limit: 255
      t.text :handler_config, limit: 65535
      t.datetime :date_changed
      t.bigint :changed_by, limit: 4
    end
  end
end
