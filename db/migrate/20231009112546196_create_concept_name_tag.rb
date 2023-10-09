# frozen_string_literal: true

# Migration responsible for creating the concept_name_tag table
class CreateConceptNameTag < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_name_tag, id: false do |t|
      t.bigint :concept_name_tag_id, null: false, limit: 4
      t.string :tag, null: false, limit: 50
      t.text :description, limit: 65535
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.boolean :voided, null: false, default: '0'
      t.bigint :voided_by, limit: 4
      t.datetime :date_voided
      t.string :void_reason, limit: 255
      t.string :uuid, null: false, limit: 38
      t.datetime :date_changed
      t.bigint :changed_by, limit: 4
    end
  end
end
