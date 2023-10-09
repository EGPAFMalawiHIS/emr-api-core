# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the concept_state_conversion table
class AddPrimaryKeysAndIndexesToConceptStateConversion < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE concept_state_conversion ADD PRIMARY KEY (concept_state_conversion_id)"
  end
end
