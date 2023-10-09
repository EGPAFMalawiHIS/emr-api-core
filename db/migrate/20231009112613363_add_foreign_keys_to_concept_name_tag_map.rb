# frozen_string_literal: true

# Migration responsible for adding foreign keys to the concept_name_tag_map table
class AddForeignKeysToConceptNameTagMap < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :concept_name_tag_map, :concept_name, column: :concept_name_id, primary_key: :concept_name_id
    add_foreign_key :concept_name_tag_map, :concept_name_tag, column: :concept_name_tag_id, primary_key: :concept_name_tag_id
  end
end
