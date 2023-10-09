# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the allergy table
class AddPrimaryKeysAndIndexesToAllergy < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE allergy ADD PRIMARY KEY (allergy_id)"
  end
end
