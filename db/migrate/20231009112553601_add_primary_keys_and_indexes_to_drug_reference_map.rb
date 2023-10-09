# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the drug_reference_map table
class AddPrimaryKeysAndIndexesToDrugReferenceMap < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE drug_reference_map ADD PRIMARY KEY (drug_reference_map_id)"
  end
end
