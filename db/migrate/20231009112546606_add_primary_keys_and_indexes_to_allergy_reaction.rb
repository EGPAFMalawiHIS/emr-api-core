# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the allergy_reaction table
class AddPrimaryKeysAndIndexesToAllergyReaction < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE allergy_reaction ADD PRIMARY KEY (allergy_reaction_id)"
  end
end
