# frozen_string_literal: true

# Migration responsible for creating the program table
class CreateProgram < ActiveRecord::Migration[6.0]
  def change
    create_table :program, id: false do |t|
      t.bigint :program_id, null: false, limit: 4
      t.bigint :concept_id, null: false, default: '0', limit: 4
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.boolean :retired, null: false, default: '0'
      t.string :name, null: false, limit: 50
      t.text :description, limit: 65535
      t.string :uuid, null: false, limit: 38
      t.bigint :outcomes_concept_id, limit: 4
    end
  end
end
