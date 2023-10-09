# frozen_string_literal: true

# Migration responsible for creating the concept_word table
class CreateConceptWord < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_word, id: false do |t|
      t.bigint :concept_word_id, null: false, limit: 4
      t.bigint :concept_id, null: false, default: '0', limit: 4
      t.string :word, null: false, default: '', limit: 50
      t.string :locale, null: false, default: '', limit: 20
      t.bigint :concept_name_id, null: false, limit: 4
      t.float :weight, default: '', limit: 53
    end
  end
end
