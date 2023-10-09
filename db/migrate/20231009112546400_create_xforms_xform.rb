# frozen_string_literal: true

# Migration responsible for creating the xforms_xform table
class CreateXformsXform < ActiveRecord::Migration[6.0]
  def change
    create_table :xforms_xform, id: false do |t|
      t.bigint :form_id, null: false, limit: 4
      t.text :xform_xml, limit: 4294967295
      t.text :layout_xml, limit: 4294967295
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.text :locale_xml, limit: 4294967295
      t.text :javascript_src, limit: 4294967295
    end
  end
end
