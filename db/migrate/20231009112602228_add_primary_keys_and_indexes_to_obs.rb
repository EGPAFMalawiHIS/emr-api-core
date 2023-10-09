# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the obs table
class AddPrimaryKeysAndIndexesToObs < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE obs ADD PRIMARY KEY (obs_id)"
  end
end
