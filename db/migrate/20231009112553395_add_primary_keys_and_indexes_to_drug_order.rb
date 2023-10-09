# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the drug_order table
class AddPrimaryKeysAndIndexesToDrugOrder < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE drug_order ADD PRIMARY KEY (order_id)"
  end
end
