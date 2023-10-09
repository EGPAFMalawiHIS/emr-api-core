# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the drug table
class AddPrimaryKeysAndIndexesToDrug < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE drug ADD PRIMARY KEY (drug_id)"
  end
end
