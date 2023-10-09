# frozen_string_literal: true

# Migration responsible for creating the concept_name_tag_map table
class CreateConceptNameTagMap < ActiveRecord::Migration[6.0]
  def change
    create_table :concept_name_tag_map, id: false do |t|
      t.bigint :concept_name_id, null: false, limit: 4
      t.bigint :concept_name_tag_id, null: false, limit: 4
    end
  end
end
