# frozen_string_literal: true

# Migration responsible for creating the concept_stop_word table
class CreateConceptStopWord < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_stop_word, id: false do |t|
      t.bigint :concept_stop_word_id, null: false, limit: 4
      t.string :word, null: false, limit: 50
      t.string :locale, limit: 50
      t.string :uuid, null: false, limit: 38
    end
  end
end
