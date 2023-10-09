# frozen_string_literal: true

# Migration responsible for creating the person table
class CreatePerson < ActiveRecord::Migration[6.0]
  def change
    create_table :person, id: false do |t|
      t.bigint :person_id, null: false, limit: 4
      t.string :gender, default: '', limit: 50
      t.date :birthdate
      t.boolean :birthdate_estimated, null: false, default: '0'
      t.boolean :dead, null: false, default: '0'
      t.datetime :death_date
      t.bigint :cause_of_death, limit: 4
      t.bigint :creator, null: false, default: '0', limit: 4
      t.datetime :date_created, null: false, default: -> {'CURRENT_TIMESTAMP'}
      t.bigint :changed_by, limit: 4
      t.datetime :date_changed
      t.boolean :voided, null: false, default: '0'
      t.bigint :voided_by, limit: 4
      t.datetime :date_voided
      t.string :void_reason, limit: 255
      t.string :uuid, null: false, limit: 38
      t.boolean :deathdate_estimated, null: false, default: '0'
      t.time :birthtime
      t.string :cause_of_death_non_coded, limit: 255
    end
  end
end
