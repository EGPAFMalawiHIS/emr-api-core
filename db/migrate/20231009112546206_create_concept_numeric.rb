# frozen_string_literal: true

# Migration responsible for creating the concept_numeric table
class CreateConceptNumeric < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_numeric, id: false do |t|
      t.bigint :concept_id, null: false, default: '0', limit: 4
      t.float :hi_absolute, limit: 53
      t.float :hi_critical, limit: 53
      t.float :hi_normal, limit: 53
      t.float :low_absolute, limit: 53
      t.float :low_critical, limit: 53
      t.float :low_normal, limit: 53
      t.string :units, limit: 50
      t.boolean :allow_decimal
      t.bigint :display_precision, limit: 4
    end
  end
end
