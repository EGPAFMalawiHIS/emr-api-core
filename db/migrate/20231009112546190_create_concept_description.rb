# frozen_string_literal: true

# Migration responsible for creating the concept_description table
class CreateConceptDescription < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_description, id: false do |t|
      t.bigint :concept_description_id, null: false, limit: 4
      t.bigint :concept_id, null: false, default: '0', limit: 4
      t.text :description, null: false, limit: 65535
      t.string :locale, null: false, default: '', limit: 50
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.string :uuid, null: false, limit: 38
    end
  end
end
