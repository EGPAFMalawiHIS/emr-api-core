# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept_set_derived table
class AddPrimaryKeysAndIndexesToConceptSetDerived < ActiveRecord::Migration[6.0]
  def up
    add_index :concept_set_derived, %i[concept_id concept_set], unique: true
  end

  def down
    remove_index :concept_set_derived, %i[concept_id concept_set]
  end
end
