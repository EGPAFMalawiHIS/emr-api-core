# frozen_string_literal: true

# Migration responsible for adding primary keys and indexes to the visit table
class AddPrimaryKeysAndIndexesToVisit < ActiveRecord::Migration[6.0]
  def change
    execute "ALTER TABLE visit ADD PRIMARY KEY (visit_id)"
  end
end
